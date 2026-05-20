<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Club extends Model
{
    protected $fillable = [
    'nom',
    'email',
    'description',
    'categorie',
    'logo',
    'statut',
    'anneeCreation',
    'parrain',
    'president_nom',
    'president_email',
    'mot_president',
    'nb_activites',
    'nb_membres',
    'membres_bureau',
    'programme_annuel',
    'responsable_id',
    ];
    protected $casts = [
    'membres_bureau' => 'array',
     ];

    public function responsable()
    {
        return $this->belongsTo(Utilisateur::class, 'responsable_id');
    }

    public function actualites()
    {
        return $this->hasMany(Actualite::class);
    }

    public function evenements()
    {
        return $this->hasMany(Evenement::class);
    }

    public function activites()
    {
        return $this->hasMany(Activite::class);
    }

    public function programmes()
    {
        return $this->hasMany(ProgrammeAnnuel::class);
    }
}