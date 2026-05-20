<?php

namespace App\Http\Controllers;

use App\Models\DemandeAdhesion;
use Illuminate\Http\Request;

class DemandeAdhesionController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'club_id'   => 'required|exists:clubs,id',
            'nom'       => 'required|string|max:100',
            'prenom'    => 'required|string|max:100',
            'email'     => 'required|email|max:150',
            'telephone' => 'nullable|string|max:20',
            'filiere'   => 'nullable|string|max:100',
            'message'   => 'nullable|string|max:1000',
        ]);

        $demande = DemandeAdhesion::create($validated);

        return response()->json([
            'success' => true,
            'message' => 'Demande envoyée avec succès.',
            'data'    => $demande,
        ], 201);
    }

    public function index(Request $request)
    {
        $demandes = DemandeAdhesion::with('club')
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json($demandes);
    }

    public function updateStatut(Request $request, $id)
    {
        $demande = DemandeAdhesion::findOrFail($id);
        $demande->statut = $request->statut; // 'accepte' ou 'refuse'
        $demande->save();

        return response()->json(['success' => true]);
    }
}
