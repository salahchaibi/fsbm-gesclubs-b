<?php

namespace App\Http\Controllers;

use App\Models\Actualite;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ActualiteController extends Controller
{
    public function index()
    {
        return response()->json(Actualite::with('club')->latest()->get());
    }

    public function store(Request $request)
    {
        $request->validate([
            'titre' => 'required|string',
        ]);

        $data = $request->except(['image']);

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('actualites', 'public');
            $data['image'] = $path;
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
            if ($actualite->image && Storage::disk('public')->exists($actualite->image)) {
                Storage::disk('public')->delete($actualite->image);
            }
            $path = $request->file('image')->store('actualites', 'public');
            $data['image'] = $path;
        }

        $actualite->update($data);
        return response()->json($actualite->load('club'));
    }

    public function destroy($id)
    {
        $actualite = Actualite::findOrFail($id);
        if ($actualite->image && Storage::disk('public')->exists($actualite->image)) {
            Storage::disk('public')->delete($actualite->image);
        }
        $actualite->delete();
        return response()->json(['message' => 'Actualité supprimée']);
    }
}