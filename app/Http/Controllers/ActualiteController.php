<?php

namespace App\Http\Controllers;

use App\Models\Actualite;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ActualiteController extends Controller
{
    private function uploadImage($file)
    {
        $response = Http::post('https://api.imgbb.com/1/upload', [
            'key' => env('IMGBB_API_KEY'),
            'image' => base64_encode(file_get_contents($file->getRealPath())),
            'name' => $file->getClientOriginalName(),
        ]);
        return $response->json()['data']['url'] ?? null;
    }

    public function index()
    {
        return response()->json(Actualite::with('club')->latest()->get());
    }

     public function store(Request $request)
{
    $request->validate(['titre' => 'required|string']);
    $data = $request->except(['image']);
    
    if ($request->hasFile('image')) {
        $url = $this->uploadImage($request->file('image'));
        if ($url) $data['image'] = $url;
    } elseif ($request->filled('image')) {
        $data['image'] = $request->input('image');
    }
    
    $actualite = Actualite::create($data);
    return response()->json($actualite->load('club'), 201);
}

    public function update(Request $request, $id)
    {
    $actualite = Actualite::findOrFail($id);
    $data = $request->except(['image', '_method']);
    
    if ($request->hasFile('image')) {
        $url = $this->uploadImage($request->file('image'));
        if ($url) $data['image'] = $url;
    } elseif ($request->filled('image')) {
        $data['image'] = $request->input('image');
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