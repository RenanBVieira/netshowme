<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class VideoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Caminho do arquivo JSON
        $jsonPath = base_path('database/data/videos.json');

        // Verifica se o arquivo existe
        if (!File::exists($jsonPath)) {
            $this->command->error("Arquivo JSON não encontrado em {$jsonPath}");
            return;
        }

        // Lê o conteúdo do JSON
        $jsonData = File::get($jsonPath);
        $videos = json_decode($jsonData, true); // Converte o JSON para array associativo

        // Verifica se o JSON tem o formato esperado
        if (!isset($videos['videos']) || !is_array($videos['videos'])) {
            $this->command->error("Formato inválido no arquivo JSON");
            return;
        }

        // Insere os dados na tabela 'videos'
        foreach ($videos['videos'] as $video) {
            // Formatar o campo "created_at"
            $video['created_at'] = Carbon::parse($video['created_at'])->format('Y-m-d H:i:s');

            // Insere o vídeo no banco
            DB::table('videos')->insert($video);
        }

        $this->command->info('Tabela videos populada com sucesso!');
    }
}
