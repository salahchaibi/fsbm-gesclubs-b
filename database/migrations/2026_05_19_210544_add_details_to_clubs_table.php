<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('clubs', function (Blueprint $table) {
            $table->string('email')->nullable()->after('nom');
            $table->string('categorie')->nullable()->after('domaine');
            $table->string('parrain')->nullable()->after('anneeCreation');
            $table->string('president_nom')->nullable()->after('parrain');
            $table->string('president_email')->nullable()->after('president_nom');
            $table->text('mot_president')->nullable()->after('president_email');
            $table->string('nb_activites')->nullable()->after('mot_president');
            $table->integer('nb_membres')->nullable()->after('nb_activites');
            $table->json('membres_bureau')->nullable()->after('nb_membres');
            $table->string('programme_annuel')->nullable()->after('membres_bureau');
        });
    }

    public function down(): void
    {
        Schema::table('clubs', function (Blueprint $table) {
            $table->dropColumn([
                'email', 'categorie', 'parrain', 'president_nom',
                'president_email', 'mot_president', 'nb_activites',
                'nb_membres', 'membres_bureau', 'programme_annuel'
            ]);
        });
    }
};