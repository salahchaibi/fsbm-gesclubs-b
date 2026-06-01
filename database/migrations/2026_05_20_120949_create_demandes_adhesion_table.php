<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('demandes_adhesion', function (Blueprint $table) {
            $table->foreignId('club_id')->constrained('clubs')->onDelete('cascade');
            $table->string('nom');
            $table->string('prenom');
            $table->string('email');
            $table->string('telephone')->nullable();
            $table->string('filiere')->nullable();
            $table->text('message')->nullable();
            $table->enum('statut', ['en_attente', 'accepte', 'refuse'])->default('en_attente');
        });
    }

    public function down(): void
    {
        Schema::table('demandes_adhesion', function (Blueprint $table) {
            $table->dropColumn(['club_id','nom','prenom','email','telephone','filiere','message','statut']);
        });
    }
};
