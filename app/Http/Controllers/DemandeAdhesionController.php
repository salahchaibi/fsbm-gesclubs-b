<?php

namespace App\Http\Controllers;

use App\Models\DemandeAdhesion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Http;

class DemandeAdhesionController extends Controller
{
    private function uploadToCloudinary($file)
    {
        $cloudName = env('CLOUDINARY_CLOUD_NAME');
        $apiKey = env('CLOUDINARY_API_KEY');
        $apiSecret = env('CLOUDINARY_API_SECRET');
        $timestamp = time();
        $signature = sha1("folder=fsbm/cartes&timestamp={$timestamp}{$apiSecret}");

        $response = Http::attach(
            'file', file_get_contents($file->getRealPath()), $file->getClientOriginalName()
        )->post("https://api.cloudinary.com/v1_1/{$cloudName}/image/upload", [
            'api_key'   => $apiKey,
            'timestamp' => $timestamp,
            'signature' => $signature,
            'folder'    => 'fsbm/cartes',
        ]);

        return $response->json()['secure_url'] ?? null;
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'club_id'        => 'required|exists:clubs,id',
            'nom'            => 'required|string|max:100',
            'prenom'         => 'required|string|max:100',
            'email'          => 'required|email|max:150',
            'telephone'      => 'nullable|string|max:20',
            'filiere'        => 'nullable|string|max:100',
            'code_apogee'    => 'nullable|string|max:20',
            'message'        => 'nullable|string|max:1000',
            'carte_etudiant' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:5048',
        ]);

        if ($request->hasFile('carte_etudiant')) {
            $url = $this->uploadToCloudinary($request->file('carte_etudiant'));
            if ($url) $validated['carte_etudiant'] = $url;
        }

        $validated['statut'] = 'en_attente';
        $demande = DemandeAdhesion::create($validated);

        return response()->json([
            'success' => true,
            'message' => 'Demande envoyée avec succès.',
            'data'    => $demande,
        ], 201);
    }

    public function index(Request $request)
    {
        $query = DemandeAdhesion::with('club')->orderBy('created_at', 'desc');
        if ($request->has('club_id')) {
            $query->where('club_id', $request->club_id);
        }
        return response()->json($query->get());
    }

    public function updateStatut(Request $request, $id)
    {
        $request->validate(['statut' => 'required|in:accepte,rejete']);

        $demande = DemandeAdhesion::with('club')->findOrFail($id);
        $demande->statut = $request->statut;
        $demande->save();

        try {
            $nomClub = $demande->club ? $demande->club->nom : 'le club';
            $prenom  = $demande->prenom;

            if ($request->statut === 'accepte') {
                $sujet   = "✅ Votre demande d'adhésion a été acceptée — $nomClub";
                $contenu = "<div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto'><div style='background:#0d2d5e;padding:24px;text-align:center'><h1 style='color:white;margin:0'>FSBM — Plateforme des Clubs</h1></div><div style='padding:32px;background:#f8f9fa'><h2 style='color:#0d2d5e'>🎉 Félicitations, $prenom !</h2><p>Votre demande d'adhésion au club <strong>$nomClub</strong> a été <strong style='color:#28a745'>acceptée</strong>.</p></div></div>";
            } else {
                $sujet   = "❌ Votre demande d'adhésion — $nomClub";
                $contenu = "<div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto'><div style='background:#0d2d5e;padding:24px;text-align:center'><h1 style='color:white;margin:0'>FSBM — Plateforme des Clubs</h1></div><div style='padding:32px;background:#f8f9fa'><h2 style='color:#0d2d5e'>Bonjour $prenom,</h2><p>Votre demande d'adhésion au club <strong>$nomClub</strong> n'a pas pu être acceptée cette fois-ci.</p></div></div>";
            }

            Mail::html($contenu, function ($message) use ($demande, $sujet) {
                $message->to('naggourdouaa@gmail.com', $demande->prenom . ' ' . $demande->nom)->subject($sujet);
            });
        } catch (\Exception $e) {
            \Log::error('Email envoi échoué: ' . $e->getMessage());
        }

        return response()->json(['success' => true, 'message' => 'Statut mis à jour']);
    }
}