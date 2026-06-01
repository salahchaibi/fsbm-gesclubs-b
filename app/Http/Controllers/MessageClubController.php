<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Models\Club;

class MessageClubController extends Controller
{
    public function send(Request $request)
    {
        $request->validate([
            'club_id' => 'required|exists:clubs,id',
            'nom'     => 'required|string|max:100',
            'email'   => 'required|email',
            'message' => 'required|string|max:2000',
        ]);

        $club = Club::findOrFail($request->club_id);

        if (!$club->email) {
            return response()->json([
                'success' => false,
                'message' => 'Ce club n\'a pas d\'email configuré.',
            ], 400);
        }

        try {
            $nom     = $request->nom;
            $email   = $request->email;
            $message = $request->message;
            $nomClub = $club->nom;

            $contenu = "
                <div style='font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;'>
                    <div style='background: #0d2d5e; padding: 24px; text-align: center;'>
                        <h1 style='color: white; margin: 0; font-size: 20px;'>Nouveau message — $nomClub</h1>
                    </div>
                    <div style='padding: 32px; background: #f8f9fa;'>
                        <h2 style='color: #0d2d5e; margin: 0 0 20px;'>Message reçu via la plateforme FSBM</h2>
                        <table style='width: 100%; border-collapse: collapse;'>
                            <tr><td style='padding: 8px 0; color: #64748b; font-weight: 600; width: 100px;'>De :</td><td style='padding: 8px 0; color: #0f172a; font-weight: 700;'>$nom</td></tr>
                            <tr><td style='padding: 8px 0; color: #64748b; font-weight: 600;'>Email :</td><td style='padding: 8px 0;'><a href='mailto:$email' style='color: #0d2d5e;'>$email</a></td></tr>
                        </table>
                        <div style='margin-top: 24px; padding: 20px; background: white; border-radius: 10px; border-left: 4px solid #e07b20;'>
                            <div style='color: #64748b; font-size: 12px; font-weight: 700; text-transform: uppercase; margin-bottom: 10px;'>Message</div>
                            <p style='color: #374151; line-height: 1.8; margin: 0;'>$message</p>
                        </div>
                        <div style='margin-top: 20px; padding: 14px; background: #eef4ff; border-radius: 8px; font-size: 13px; color: #64748b;'>
                            Pour répondre, écrivez directement à : <a href='mailto:$email' style='color: #0d2d5e; font-weight: 700;'>$email</a>
                        </div>
                    </div>
                    <div style='background: #0d2d5e; padding: 16px; text-align: center;'>
                        <p style='color: rgba(255,255,255,0.6); font-size: 12px; margin: 0;'>FSBM — Faculté des Sciences Ben M'Sik, Casablanca</p>
                    </div>
                </div>
            ";

            Mail::html($contenu, function ($msg) use ($club, $nom, $email, $nomClub) {
                $msg->to($club->email, $nomClub)
                    ->subject("📩 Nouveau message de $nom via FSBM")
                    ->replyTo($email, $nom);
            });

            return response()->json([
                'success' => true,
                'message' => 'Message envoyé avec succès !',
            ]);

        } catch (\Exception $e) {
            \Log::error('Email club échoué: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Erreur lors de l\'envoi.',
            ], 500);
        }
    }
}
