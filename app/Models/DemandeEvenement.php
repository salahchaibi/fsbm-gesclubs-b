<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DemandeEvenement extends Model
{
    protected $table = 'demandes_evenement';

    protected $fillable = [
        'nom', 'email', 'telephone', 'club',
        'titre', 'type_evenement', 'date', 'heure',
        'lieu', 'participants', 'description',
        'affiche', 'programme', 'besoins_logistiques',
        'statut', 'club_id',
    ];
}
