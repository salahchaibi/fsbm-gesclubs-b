<?php
 
namespace App\Http\Controllers;
 
use App\Models\DemandeAdhesion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
 
class DemandeAdhesionController extends Controller
{
    public function store(Request $request)
{
    $validated = $request->validate([
        'club_id'     => 'required|exists:clubs,id',
        'nom'         => 'required|string|max:100',
        'prenom'      => 'required|string|max:100',
        'email'       => 'required|email|max:150',
        'telephone'   => 'nullable|string|max:20',
        'filiere'     => 'nullable|string|max:100',
        'code_apogee' => 'nullable|string|max:20',
        'message'     => 'nullable|string|max:1000',
        'carte_etudiant' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
    ]);
     if ($request->hasFile('carte_etudiant')) {
        $path = $request->file('carte_etudiant')->store('cartes_etudiants', 'public');
        $validated['carte_etudiant'] = $path;
    }

    $validated['statut'] = 'en_attente';
    $demande = DemandeAdhesion::create($validated);

    return response()->json([
        'success' => true,
        'message' => 'Demande envoyée avec succès.',
        'data'    => $demande,
    ], 201);

    $validated['statut'] = 'en_attente';
    $demande = DemandeAdhesion::create($validated);

    
}
 
    public function index(Request $request)
    {
        $query = DemandeAdhesion::with('club')->orderBy('created_at', 'desc');
 
        // Filtrer par club_id si passé en paramètre
        if ($request->has('club_id')) {
            $query->where('club_id', $request->club_id);
        }
 
        return response()->json($query->get());
    }
 
    public function updateStatut(Request $request, $id)
    {
        $request->validate([
            'statut' => 'required|in:accepte,rejete',
        ]);
 
        $demande = DemandeAdhesion::with('club')->findOrFail($id);
        $demande->statut = $request->statut;
        $demande->save();
 
        // Envoyer un email de notification
        try {
            $nomClub = $demande->club ? $demande->club->nom : 'le club';
            $prenom  = $demande->prenom;
            $nom     = $demande->nom;
 
            if ($request->statut === 'accepte') {
                $sujet   = "✅ Votre demande d'adhésion a été acceptée — $nomClub";
                $contenu = "
                    <div style='font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;'>
                        <div style='background: #0d2d5e; padding: 24px; text-align: center;'>
                            <h1 style='color: white; margin: 0; font-size: 22px;'>FSBM — Plateforme des Clubs</h1>
                        </div>
                        <div style='padding: 32px; background: #f8f9fa;'>
                            <h2 style='color: #0d2d5e;'>🎉 Félicitations, $prenom !</h2>
                            <p style='font-size: 16px; color: #333;'>
                                Votre demande d'adhésion au club <strong>$nomClub</strong> a été <strong style='color: #28a745;'>acceptée</strong>.
                            </p>
                            <p style='font-size: 15px; color: #555;'>
                                Vous êtes maintenant membre officiel du club. Le responsable vous contactera prochainement pour les prochaines étapes.
                            </p>
                            <div style='background: #e07b20; color: white; padding: 16px; border-radius: 8px; margin-top: 24px;'>
                                <strong>Bienvenue dans $nomClub !</strong>
                            </div>
                        </div>
                        <div style='background: #0d2d5e; padding: 16px; text-align: center;'>
                            <p style='color: rgba(255,255,255,0.7); font-size: 12px; margin: 0;'>FSBM — Faculté des Sciences Ben M'Sik, Casablanca</p>
                        </div>
                    </div>
                ";
            } else {
                $sujet   = "❌ Votre demande d'adhésion — $nomClub";
                $contenu = "
                    <div style='font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;'>
                        <div style='background: #0d2d5e; padding: 24px; text-align: center;'>
                            <h1 style='color: white; margin: 0; font-size: 22px;'>FSBM — Plateforme des Clubs</h1>
                        </div>
                        <div style='padding: 32px; background: #f8f9fa;'>
                            <h2 style='color: #0d2d5e;'>Bonjour $prenom,</h2>
                            <p style='font-size: 16px; color: #333;'>
                                Nous vous remercions de l'intérêt que vous portez au club <strong>$nomClub</strong>.
                            </p>
                            <p style='font-size: 15px; color: #555;'>
                                Après examen de votre candidature, nous sommes au regret de vous informer que votre demande d'adhésion n'a pas pu être acceptée cette fois-ci.
                            </p>
                            <p style='font-size: 15px; color: #555;'>
                                Nous vous encourageons à postuler à d'autres clubs de la FSBM qui pourraient correspondre à vos intérêts.
                            </p>
                        </div>
                        <div style='background: #0d2d5e; padding: 16px; text-align: center;'>
                            <p style='color: rgba(255,255,255,0.7); font-size: 12px; margin: 0;'>FSBM — Faculté des Sciences Ben M'Sik, Casablanca</p>
                        </div>
                    </div>
                ";
            }
 
            Mail::html($contenu, function ($message) use ($demande, $sujet) {
                $message->to($demande->email, $demande->prenom . ' ' . $demande->nom)
                        ->subject($sujet);
            });
 
        } catch (\Exception $e) {
            // L'email a échoué mais on retourne quand même le succès
            \Log::error('Email envoi échoué: ' . $e->getMessage());
        }
 
        return response()->json([
            'success' => true,
            'message' => 'Statut mis à jour' . (isset($e) ? ' (email non envoyé)' : ' et email envoyé'),
        ]);
    }
}