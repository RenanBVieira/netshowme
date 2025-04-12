<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\VideoController;

Route::get('/', function () {
    return view('welcome');
});

// Rotas de vídeos
Route::get('/videos', [VideoController::class, 'index']); // Lista de vídeos
Route::get('/videos/{id}', [VideoController::class, 'show']); // Detalhes do vídeo
Route::patch('/videos/{id}', [VideoController::class, 'update']); // Atualização de dados