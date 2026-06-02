<?php

namespace App\Http\Controllers;

use App\Models\Actualite;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ActualiteController extends Controller
{
    private function uploadToCloudinary($file)
   {
    $cloudName = env('CLOUDINARY_CLOUD_NAME');
    $apiKey = env('CLOUDINARY_API_KEY');
    $apiSecret = env('CLOUDINARY_API_SECRET');
    $timestamp = time();
    $signature = sha1("folder=fsbm/actualites&timestamp={$timestamp}{$apiSecret}");

    $response = Http::attach(
        'file', file_get_contents($file->getRealPath()), $file->getClientOriginalName()
    )->post("https://api.cloudinary.com/v1_1/{$cloudName}/image/upload", [
        'api_key'   => $apiKey,
        'timestamp' => $timestamp,
        'signature' => $signature,
        'folder'    => 'fsbm/actualites',
    ]);

    \Log::info('Cloudinary response: ' . json_encode($response->json()));
    return $response->json()['secure_url'] ?? null;
    }

    public function index()
    {
        return response()->json(Actualite::with('club')->latest()->get());
    }

    public function store(Request $request)
    {
        $request->validate(['titre' => 'required|string']);
        $data = $request->except(['image']);
        \Log::info('Files reçus: ' . json_encode(array_keys($request->allFiles())));
        \Log::info('Has image: ' . ($request->hasFile('image') ? 'oui' : 'non'));

        if ($request->hasFile('image')) {
            $url = $this->uploadToCloudinary($request->file('image'));
            if ($url) $data['image'] = $url;
        }

        $actualite = Actualite::create($data);
        return response()->json($actualite->load('club'), 201);
    }

    public function show($id)
    {
        return response()->json(Actualite::with('club')->findOrFail($id));
    }

    public function update(Request $request, $id)
    {
        $actualite = Actualite::findOrFail($id);
        $data = $request->except(['image', '_method']);

        if ($request->hasFile('image')) {
            $url = $this->uploadToCloudinary($request->file('image'));
            if ($url) $data['image'] = $url;
        }

        $actualite->update($data);
        return response()->json($actualite->load('club'));
    }

    public function destroy($id)
    {
        Actualite::findOrFail($id)->delete();
        return response()->json(['message' => 'Actualité supprimée']);
    }
}