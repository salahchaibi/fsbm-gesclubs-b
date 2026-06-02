<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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

    public function store(Request $request)
    {
        try {
            $section = $request->input('section');
            $data = json_decode($request->input('data', '{}'), true) ?? [];

            DB::table('page_accueil')->updateOrInsert(
                ['section' => $section],
                ['data' => json_encode($data), 'updated_at' => now(), 'created_at' => now()]
            );

            return response()->json(['success' => true, 'section' => $section]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}" " 
