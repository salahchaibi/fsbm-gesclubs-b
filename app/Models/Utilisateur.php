<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;

class Utilisateur extends Authenticatable
{
    use HasApiTokens;

    protected $table = 'utilisateurs';
    protected $authPasswordName = 'motDePasse';

    protected $fillable = [
        'nom',
        'prenom',
        'email',
        'motDePasse',
        'photo',
        'dateCreation',
        'statut',
        'role',
        'club_id',
    ];

    protected $hidden = [
        'motDePasse',
    ];

    protected function casts(): array
    {
        return [];
    }

    public function club()
    {
        return $this->hasOne(Club::class, 'responsable_id');
    }

    public function annonces()
    {
        return $this->hasMany(AnnonceInstitutionnelle::class);
    }

    public function inscriptions()
    {
        return $this->hasMany(Inscription::class);
    }
}