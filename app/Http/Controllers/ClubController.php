<?php

namespace App\Http\Controllers;

use App\Models\Club;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ClubController extends Controller
{
    private function uploadToCloudinary($file, $folder = 'fsbm/clubs', $resourceType = 'image')
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

    public function index()
    {
        return response()->json(Club::all());
    }

    public function store(Request $request)
    {
        $request->validate(['nom' => 'required|string']);
        $club = Club::create($request->all());
        return response()->json($club, 201);
    }

    public function show($id)
    {
        return response()->json(Club::findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $club = Club::findOrFail($id);
        $data = $request->except(['logo', 'programme_fichier', '_method']);

        if ($request->hasFile('logo')) {
            $url = $this->uploadToCloudinary($request->file('logo'), 'fsbm/logos');
            if ($url) $data['logo'] = $url;
        }

        if ($request->hasFile('programme_fichier')) {
            $url = $this->uploadToCloudinary($request->file('programme_fichier'), 'fsbm/programmes', 'raw');
            if ($url) $data['programme_fichier'] = $url;
        }

        $club->update($data);
        return response()->json($club);
    }

    public function deleteProgramme($id)
    {
        $club = Club::findOrFail($id);
        $club->programme_fichier = null;
        $club->save();
        return response()->json(['message' => 'Programme supprimé']);
    }

    public function destroy($id)
    {
        Club::findOrFail($id)->delete();
        return response()->json(['message' => 'Club supprimé']);
    }
}