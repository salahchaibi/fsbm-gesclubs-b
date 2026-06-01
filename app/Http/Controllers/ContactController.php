<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function send(Request $request)
    {
        $request->validate([
            'prenom'  => 'required|string',
            'nom'     => 'required|string',
            'email'   => 'required|email',
            'message' => 'required|string',
        ]);

        \Illuminate\Support\Facades\Mail::send([], [], function ($m) use ($request) {
            $m->to('fsbm.contact@univh2c.ma')
              ->replyTo($request->email, $request->prenom . ' ' . $request->nom)
              ->subject('📩 Nouveau message — ' . ($request->sujet ?: 'Contact FSBM'))
              ->html("
                <div style='font-family:Arial,sans-serif;max-width:600px;margin:0 auto'>
                  <div style='background:linear-gradient(135deg,#0d2d5e,#1a4a8a);padding:30px;border-radius:12px 12px 0 0;text-align:center'>
                    <h1 style='color:white;margin:0;font-size:20px'>FSBM — Nouveau message de contact</h1>
                  </div>
                  <div style='background:#f8fafc;border:1px solid #e2e8f0;padding:30px;border-radius:0 0 12px 12px'>
                    <p><strong>Nom :</strong> {$request->prenom} {$request->nom}</p>
                    <p><strong>Email :</strong> {$request->email}</p>
                    <p><strong>Sujet :</strong> " . ($request->sujet ?: '—') . "</p>
                    <hr style='border:none;border-top:1px solid #e2e8f0;margin:20px 0'>
                    <p><strong>Message :</strong></p>
                    <p style='color:#4a6080;line-height:1.8'>{$request->message}</p>
                  </div>
                </div>
              ");
        });

        return response()->json(['success' => true]);
    }
}