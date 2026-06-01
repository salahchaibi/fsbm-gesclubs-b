<?php
 
namespace App\Http\Controllers;
 
use App\Models\Club;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
 
class ClubController extends Controller
{
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
 
        // Upload logo
        if ($request->hasFile('logo')) {
            if ($club->logo && Storage::disk('public')->exists($club->logo)) {
                Storage::disk('public')->delete($club->logo);
            }
            $data['logo'] = $request->file('logo')->store('logos', 'public');
        }
 
        // Upload programme fichier (PDF ou Word)
        if ($request->hasFile('programme_fichier')) {
            if ($club->programme_fichier && Storage::disk('public')->exists($club->programme_fichier)) {
                Storage::disk('public')->delete($club->programme_fichier);
            }
            $data['programme_fichier'] = $request->file('programme_fichier')->store('programmes', 'public');
        }
 
        $club->update($data);
        return response()->json($club);

    }
    public function deleteProgramme($id){

    $club = Club::findOrFail($id);
    if ($club->programme_fichier && Storage::disk('public')->exists($club->programme_fichier)) {
        Storage::disk('public')->delete($club->programme_fichier);
    }
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