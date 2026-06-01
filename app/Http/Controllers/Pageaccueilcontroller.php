<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PageAccueilController extends Controller
{
    // Chemin du fichier JSON qui stocke le contenu
    private $jsonPath = 'page_accueil/content.json';

    /**
     * GET /api/page-accueil
     * Retourne le contenu actuel de la page d'accueil
     */
    public function index()
    {
        if (!Storage::exists($this->jsonPath)) {
            return response()->json(null);
        }

        $content = json_decode(Storage::get($this->jsonPath), true);
        return response()->json($content);
    }

    /**
     * POST /api/page-accueil
     * Sauvegarde une section du contenu (doyen, vice_doyen, organigramme, chiffres, objectifs)
     */
    public function store(Request $request)
    {
        $section = $request->input('section');
        $data    = json_decode($request->input('data', '{}'), true) ?? [];

        // Charger le contenu existant
        $content = [];
        if (Storage::exists($this->jsonPath)) {
            $content = json_decode(Storage::get($this->jsonPath), true) ?? [];
        }

        // ── Traitement selon la section ──
        switch ($section) {

            case 'doyen':
                if ($request->hasFile('photo')) {
                    // Supprimer l'ancienne photo si elle existe
                    if (!empty($content['doyen']['photo'])) {
                        Storage::delete('public/' . $content['doyen']['photo']);
                    }
                    $path = $request->file('photo')->store('page_accueil/photos', 'public');
                    $data['photo'] = $path;
                } else {
                    // Garder l'ancienne photo
                    $data['photo'] = $content['doyen']['photo'] ?? null;
                }
                $content['doyen'] = $data;
                break;

            case 'vice_doyen':
                if ($request->hasFile('photo')) {
                    if (!empty($content['vice_doyen']['photo'])) {
                        Storage::delete('public/' . $content['vice_doyen']['photo']);
                    }
                    $path = $request->file('photo')->store('page_accueil/photos', 'public');
                    $data['photo'] = $path;
                } else {
                    $data['photo'] = $content['vice_doyen']['photo'] ?? null;
                }
                $content['vice_doyen'] = $data;
                break;

            case 'organigramme':
                // Photos des personnes de l'organigramme
                $photoKeys = [
                    'photo_doyen'  => ['direction', 0],
                    'photo_vd1'    => ['vice_doyens', 0],
                    'photo_vd2'    => ['vice_doyens', 1],
                    'photo_resp1'  => ['responsables', 0],
                    'photo_resp2'  => ['responsables', 1],
                ];

                foreach ($photoKeys as $fileKey => [$group, $index]) {
                    if ($request->hasFile($fileKey)) {
                        // Supprimer ancienne photo
                        $oldPhoto = $content['organigramme'][$group][$index]['photo'] ?? null;
                        if ($oldPhoto) Storage::delete('public/' . $oldPhoto);

                        $path = $request->file($fileKey)->store('page_accueil/photos', 'public');
                        $data[$group][$index]['photo'] = $path;
                    } else {
                        // Garder ancienne photo
                        $data[$group][$index]['photo'] =
                            $content['organigramme'][$group][$index]['photo'] ?? null;
                    }
                }
                $content['organigramme'] = $data;
                break;

            case 'chiffres':
                $content['chiffres'] = $data;
                break;

            case 'objectifs':
                $content['objectifs'] = $data;
                break;

            default:
                return response()->json(['error' => 'Section inconnue'], 400);
        }

        // Sauvegarder le JSON mis à jour
        Storage::put($this->jsonPath, json_encode($content, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT));

        return response()->json([
            'success' => true,
            'section' => $section,
            'data'    => $content[$section] ?? $data,
        ]);
    }
}