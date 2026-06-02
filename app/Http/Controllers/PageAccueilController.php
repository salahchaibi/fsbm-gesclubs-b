<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class PageAccueilController extends Controller
{
    public function index()
    {
        try {
            $data = [];
            $rows = DB::table('page_accueil')->get();
            foreach ($rows as $row) {
                $data[$row->section] = json_decode($row->data, true);
            }
            return response()->json(empty($data) ? null : $data);
        } catch (\Exception $e) {
            return response()->json(null);
        }
    }

    private function uploadToCloudinary($file)
    {
        $cloudName = env('CLOUDINARY_CLOUD_NAME');
        $apiKey = env('CLOUDINARY_API_KEY');
        $apiSecret = env('CLOUDINARY_API_SECRET');

        $timestamp = time();
        $signature = sha1("folder=fsbm/page_accueil&timestamp={$timestamp}{$apiSecret}");

        $response = Http::attach(
            'file', file_get_contents($file->getRealPath()), $file->getClientOriginalName()
        )->post("https://api.cloudinary.com/v1_1/{$cloudName}/image/upload", [
            'api_key'   => $apiKey,
            'timestamp' => $timestamp,
            'signature' => $signature,
            'folder'    => 'fsbm/page_accueil',
        ]);

        return $response->json()['secure_url'] ?? null;
    }

    public function store(Request $request)
    {
        try {
            $section = $request->input('section');
            $data = json_decode($request->input('data', '{}'), true) ?? [];

            foreach ($request->allFiles() as $key => $file) {
                $url = $this->uploadToCloudinary($file);
                if ($url) $data[$key] = $url;
            }

            DB::table('page_accueil')->updateOrInsert(
                ['section' => $section],
                ['data' => json_encode($data), 'updated_at' => now(), 'created_at' => now()]
            );

            return response()->json(['success' => true, 'data' => $data]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
