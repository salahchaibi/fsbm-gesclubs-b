<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class ClubSeeder extends Seeder
{
    public function run(): void
    {
        $now = Carbon::now();

        $clubs = [
            ['nom' => 'CtrlArt-FSBM',                                     'domaine' => 'Culturel',        'logo' => 'ctrlart.png'],
            ['nom' => 'Club Sciences et Technologies FSBM',                'domaine' => 'Scientifique',    'logo' => 'sciences-tech.png'],
            ['nom' => 'Club Infinity Space FSBM',                          'domaine' => 'Scientifique',    'logo' => 'infinity-space.png'],
            ['nom' => 'Club ABC Junior FSBM',                              'domaine' => 'Entrepreneuriat', 'logo' => 'abc-junior.png'],
            ['nom' => 'Club Soft Skills FSBM',                             'domaine' => 'Entrepreneuriat', 'logo' => 'soft-skills.png'],
            ['nom' => 'Club Cinéma FSBM',                                  'domaine' => 'Culturel',        'logo' => null],
            ['nom' => 'Club Ibn Khaldoun FSBM',                            'domaine' => 'Culturel',        'logo' => 'Cik.png'],
            ['nom' => 'Club Digital and Cybersecurity FSBM',               'domaine' => 'Scientifique',    'logo' => null],
            ['nom' => 'Club Innovation, Création et Entrepreneuriat FSBM', 'domaine' => 'Entrepreneuriat', 'logo' => null],
            ['nom' => 'AI & DEV Community FSBM',                           'domaine' => 'Scientifique',    'logo' => 'aidev.png'],
            ['nom' => 'Club Robotique & IoT FSBM',                         'domaine' => 'Scientifique',    'logo' => 'robotique.png'],
            ['nom' => 'Club Santé et Sport FSBM',                          'domaine' => 'Sport',           'logo' => 'sante-sport.png'],
            ['nom' => 'Club Art Identité Digital FSBM',                    'domaine' => 'Culturel',        'logo' => 'art-identite.png'],
            ['nom' => 'Club Education Sportive FSBM',                      'domaine' => 'Sport',           'logo' => null],
            ['nom' => 'Club Santé et Environnement FSBM',                  'domaine' => 'Humanitaire',     'logo' => 'sante-env.png'],
            ['nom' => 'Club Des Étudiants Internationaux FSBM',            'domaine' => 'Culturel',        'logo' => null],
            ['nom' => 'Club Lions FSBM',                                   'domaine' => 'Humanitaire',     'logo' => 'lions.png'],
            ['nom' => 'Epik Leaders FSBM',                                 'domaine' => 'Entrepreneuriat', 'logo' => null],
            ['nom' => 'HELIOS FSBM',                                       'domaine' => 'Scientifique',    'logo' => 'helios.png'],
            ['nom' => 'Enactus FSBM',                                      'domaine' => 'Entrepreneuriat', 'logo' => 'enactus.png'],
            ['nom' => 'Club Qoran FSBM',                                   'domaine' => 'Culturel',        'logo' => 'qoran.png'],
        ];

        foreach ($clubs as $club) {
            DB::table('clubs')->insert([
                'nom'            => $club['nom'],
                'domaine'        => $club['domaine'],
                'description'    => null,
                'logo'           => $club['logo'],
                'statut'         => 'actif',
                'anneeCreation'  => 2020,
                'responsable_id' => null,
                'created_at'     => $now,
                'updated_at'     => $now,
            ]);
        }
    }
}