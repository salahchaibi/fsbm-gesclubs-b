<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UtilisateurController;
use App\Http\Controllers\CompteController;
use App\Http\Controllers\ClubController;
use App\Http\Controllers\AnnonceInstitutionnelleController;
use App\Http\Controllers\ActualiteController;
use App\Http\Controllers\EvenementController;
use App\Http\Controllers\ActiviteController;
use App\Http\Controllers\ProgrammeAnnuelController;
use App\Http\Controllers\InscriptionController;
use App\Http\Controllers\MediaController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DemandeAdhesionController;
use App\Http\Controllers\DemandeEvenementController;
use App\Http\Controllers\PageAccueilController;
use App\Http\Controllers\MessageClubController;
use App\Http\Controllers\ContactController;

// Routes publiques
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::get('evenements', [EvenementController::class, 'index']);
Route::post('demandes-evenement', [DemandeEvenementController::class, 'store']);
Route::post('messages-club', [MessageClubController::class, 'send']);
Route::post('contact', [ContactController::class, 'send']);


// Routes publiques lecture
Route::get('clubs', [ClubController::class, 'index']);
Route::get('clubs/{id}', [ClubController::class, 'show']);
Route::get('actualites', [ActualiteController::class, 'index']);
Route::get('evenements', [EvenementController::class, 'index']);
Route::get('annonces', [AnnonceInstitutionnelleController::class, 'index']);
Route::get('actualites', [ActualiteController::class, 'index']);
Route::get('/page-accueil', [PageAccueilController::class, 'index']);
Route::post('/page-accueil', [PageAccueilController::class, 'store'])->middleware('auth:sanctum');
Route::get('actualites/{id}', [ActualiteController::class, 'show']);

// Demandes d'adhésion — store est public, index et update sont protégés
Route::post('/demandes-adhesion', [DemandeAdhesionController::class, 'store']);

// Routes protégées
Route::middleware('auth:sanctum')->group(function () {
    // Profil et logout
    Route::post('logout', [AuthController::class, 'logout']);
    Route::get('profil', [AuthController::class, 'profil']);

    // Gestion
    Route::apiResource('utilisateurs', UtilisateurController::class);
    Route::apiResource('comptes', CompteController::class);

    // Clubs
    Route::post('clubs', [ClubController::class, 'store']);
    Route::put('clubs/{id}', [ClubController::class, 'update']);
    Route::patch('clubs/{id}', [ClubController::class, 'update']);
    Route::delete('clubs/{id}', [ClubController::class, 'destroy']);
    Route::delete('clubs/{id}/programme', [ClubController::class, 'deleteProgramme']);

    Route::apiResource('annonces', AnnonceInstitutionnelleController::class);
    Route::post('actualites', [ActualiteController::class, 'store']);
    Route::put('actualites/{id}', [ActualiteController::class, 'update']);
    Route::post('actualites/{id}', [ActualiteController::class, 'update']);
    Route::delete('actualites/{id}', [ActualiteController::class, 'destroy']);
    Route::post('evenements', [EvenementController::class, 'store']);
    Route::put('evenements/{id}', [EvenementController::class, 'update']);
    Route::patch('evenements/{id}', [EvenementController::class, 'update']);
    Route::delete('evenements/{id}', [EvenementController::class, 'destroy']);
    Route::apiResource('programmes', ProgrammeAnnuelController::class);
    Route::apiResource('inscriptions', InscriptionController::class);
    Route::apiResource('medias', MediaController::class);

    // Demandes d'adhésion — routes protégées
    Route::get('demandes-adhesion', [DemandeAdhesionController::class, 'index']);
    Route::put('demandes-adhesion/{id}', [DemandeAdhesionController::class, 'updateStatut']);
    Route::patch('demandes-adhesion/{id}', [DemandeAdhesionController::class, 'updateStatut']);

    Route::get('demandes-evenement', [DemandeEvenementController::class, 'index']);
    Route::put('demandes-evenement/{id}', [DemandeEvenementController::class, 'updateStatut']);
    Route::delete('demandes-evenement/{id}', [DemandeEvenementController::class, 'destroy']);
});