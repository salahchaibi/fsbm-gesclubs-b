<?php

namespace App\Http\Controllers;

use App\Models\Evenement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class EvenementController extends Controller
{
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
            $path = $request->file('image')->store('evenements', 'public');
            $data['image'] = $path;
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
            if ($evenement->image && Storage::disk('public')->exists($evenement->image)) {
                Storage::disk('public')->delete($evenement->image);
            }
            $path = $request->file('image')->store('evenements', 'public');
            $data['image'] = $path;
        }

        $evenement->update($data);
        return response()->json($evenement);
    }

    public function destroy($id)
    {
        $evenement = Evenement::findOrFail($id);
        if ($evenement->image && Storage::disk('public')->exists($evenement->image)) {
            Storage::disk('public')->delete($evenement->image);
        }
        $evenement->delete();
        return response()->json(['message' => 'Événement supprimé']);
    }
}