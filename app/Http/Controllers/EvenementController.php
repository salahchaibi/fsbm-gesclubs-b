<?php

namespace App\Http\Controllers;

use App\Models\Evenement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class EvenementController extends Controller
{
    private function uploadToCloudinary($file)
    {
        $cloudName = env('CLOUDINARY_CLOUD_NAME');
        $apiKey = env('CLOUDINARY_API_KEY');
        $apiSecret = env('CLOUDINARY_API_SECRET');
        $timestamp = time();
        $signature = sha1("folder=fsbm/evenements&timestamp={$timestamp}{$apiSecret}");

        $response = Http::attach(
            'file', file_get_contents($file->getRealPath()), $file->getClientOriginalName()
        )->post("https://api.cloudinary.com/v1_1/{$cloudName}/image/upload", [
            'api_key'   => $apiKey,
            'timestamp' => $timestamp,
            'signature' => $signature,
            'folder'    => 'fsbm/evenements',
        ]);

        return $response->json()['secure_url'] ?? null;
    }

    public function index()
    {
        return response()->json(Evenement::with('club')->get());
    }

    public function store(Request $request)
    {
        $request->validate([
            'titre'   => 'required|string',
            'club_id' => 'required|exists:clubs,id',
        ]);

        $data = $request->except(['image']);

        if ($request->hasFile('image')) {
            $url = $this->uploadToCloudinary($request->file('image'));
            if ($url) $data['image'] = $url;
        }

        $evenement = Evenement::create($data);
        return response()->json($evenement, 201);
    }

    public function show($id)
    {
        return response()->json(Evenement::with('club')->findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $evenement = Evenement::findOrFail($id);
        $data = $request->except(['image', '_method']);

        if ($request->hasFile('image')) {
            $url = $this->uploadToCloudinary($request->file('image'));
            if ($url) $data['image'] = $url;
        }

        $evenement->update($data);
        return response()->json($evenement);
    }

    public function destroy($id)
    {
        Evenement::findOrFail($id)->delete();
        return response()->json(['message' => 'Événement supprimé']);
    }
}