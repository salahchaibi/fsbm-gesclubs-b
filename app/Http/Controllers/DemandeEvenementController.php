<?php

namespace App\Http\Controllers;

use App\Models\DemandeEvenement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class DemandeEvenementController extends Controller
{
    private function uploadToCloudinary($file, $folder = 'fsbm/demandes', $resourceType = 'image')
    {
        $cloudName = env('CLOUDINARY_CLOUD_NAME');
        $apiKey = env('CLOUDINARY_API_KEY');
        $apiSecret = env('CLOUDINARY_API_SECRET');
        $timestamp = time();
        $signature = sha1("folder={$folder}&timestamp={$timestamp}{$apiSecret}");

        $response = Http::attach(
            'file', file_get_contents($file->getRealPath()), $file->getClientOriginalName()
        )->post("https://api.cloudinary.com/v1_1/{$cloudName}/{$resourceType}/upload", [
            'api_key'   => $apiKey,
            'timestamp' => $timestamp,
            'signature' => $signature,
            'folder'    => $folder,
        ]);

        return $response->json()['secure_url'] ?? null;
    }

    public function index(Request $request)
    {
        $demandes = DemandeEvenement::orderBy('created_at', 'desc')->get();
        return response()->json($demandes);
    }

    public function store(Request $request)
    {
        $request->validate([
            'nom'   => 'required|string',
            'email' => 'required|email',
            'titre' => 'required|string',
        ]);

        $data = $request->except(['affiche', 'programme']);

        if ($request->hasFile('affiche')) {
            $url = $this->uploadToCloudinary($request->file('affiche'), 'fsbm/demandes');
            if ($url) $data['affiche'] = $url;
        }
        if ($request->hasFile('programme')) {
            $url = $this->uploadToCloudinary($request->file('programme'), 'fsbm/demandes', 'raw');
            if ($url) $data['programme'] = $url;
        }

        $demande = DemandeEvenement::create($data);
        return response()->json(['success' => true, 'data' => $demande], 201);
    }

    public function updateStatut(Request $request, $id)
    {
        $demande = DemandeEvenement::findOrFail($id);
        $demande->statut = $request->statut;
        $demande->save();

        $statut = $request->statut;
        $email = $demande->email;
        $nom = $demande->nom;
        $titre = $demande->titre;

        \Illuminate\Support\Facades\Mail::send([], [], function ($message) use ($email, $nom, $titre, $statut) {
            $message->to($email)
                ->subject($statut === 'accepte' ? '✅ Demande d\'événement acceptée' : '❌ Demande d\'événement refusée')
                ->html($statut === 'accepte'
                    ? "<div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto;padding:20px'><div style='background:linear-gradient(135deg,#0d2d5e,#1a4a8a);padding:30px;border-radius:12px 12px 0 0;text-align:center'><h1 style='color:white;margin:0;font-size:22px'>FSBM — Plateforme des Clubs</h1></div><div style='background:#f0fdf4;border:1px solid #86efac;padding:30px;border-radius:0 0 12px 12px'><h2 style='color:#15803d'>✅ Demande acceptée !</h2><p>Bonjour <strong>{$nom}</strong>,</p><p>Votre demande d'organisation de l'événement <strong>\"{$titre}\"</strong> a été <strong style='color:#15803d'>acceptée</strong> par l'administration.</p><p style='color:#64748b;font-size:13px;margin-top:20px'>FSBM — Faculté des Sciences Ben M'Sik, Casablanca</p></div></div>"
                    : "<div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto;padding:20px'><div style='background:linear-gradient(135deg,#0d2d5e,#1a4a8a);padding:30px;border-radius:12px 12px 0 0;text-align:center'><h1 style='color:white;margin:0;font-size:22px'>FSBM — Plateforme des Clubs</h1></div><div style='background:#fef2f2;border:1px solid #fca5a5;padding:30px;border-radius:0 0 12px 12px'><h2 style='color:#dc2626'>❌ Demande refusée</h2><p>Bonjour <strong>{$nom}</strong>,</p><p>Votre demande d'organisation de l'événement <strong>\"{$titre}\"</strong> n'a pas pu être acceptée cette fois-ci.</p><p style='color:#64748b;font-size:13px;margin-top:20px'>FSBM — Faculté des Sciences Ben M'Sik, Casablanca</p></div></div>"
                );
        });

        return response()->json(['success' => true]);
    }

    public function destroy($id)
    {
        DemandeEvenement::findOrFail($id)->delete();
        return response()->json(['message' => 'Demande supprimée']);
    }
}