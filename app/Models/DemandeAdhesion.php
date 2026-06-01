<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DemandeAdhesion extends Model
{
    protected $table = 'demandes_adhesion';

    protected $fillable = [
        'club_id', 'nom', 'prenom', 'email',
        'telephone', 'filiere', 'message', 'statut','code_apogee','carte_etudiant',
    ];

    public function club()
    {
        return $this->belongsTo(Club::class);
    }
}