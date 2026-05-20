<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ClubDetailsSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('clubs')->where('nom', 'Club Qoran FSBM')->update([
            'email'           => 'clubcoranfsbm@gmail.com',
            'description'     => 'Le Club Coran FSBM joue un rôle essentiel au sein de la communauté universitaire en favorisant la promotion des valeurs éthiques, spirituelles et de tolérance inspirées du Coran. À travers l\'organisation de conférences, d\'ateliers d\'apprentissage, il offre aux étudiants un espace d\'épanouissement personnel et de partage culturel. En parallèle, le club dynamise la vie de la faculté en initiant des actions sociales et caritatives qui renforcent l\'entraide, la solidarité et le dialogue constructif entre les étudiants de l\'établissement.',
            'categorie'       => 'Culturel',
            'anneeCreation'   => 2026,
            'parrain'         => 'Soumia MORDANE',
            'president_nom'   => 'EL MANSSOURI Hanae',
            'president_email' => 'ELMANSSOURIHANAE@GMAIL.COM',
            'mot_president'   => 'Je tiens à remercier chaleureusement la direction de notre faculté pour son soutien continu, les membres du bureau pour leur dévouement infatigable, ainsi que vous tous, qui faites vivre ce club par votre présence et votre enthousiasme.',
            'nb_membres'      => 322,
            'nb_activites'    => null,
            'membres_bureau'  => json_encode([
                ['nom' => 'Soukaina AIT ELMAKKI', 'role' => 'Vice-présidente'],
                ['nom' => 'Meryem ACHIK',          'role' => 'Secrétaire générale'],
                ['nom' => 'Wiam NAJI',             'role' => 'Trésorière'],
                ['nom' => 'Assia HANBAL',          'role' => 'Responsable de l\'organisation'],
            ]),
        ]);
    }
}