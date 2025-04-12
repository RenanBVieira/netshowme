<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Video extends Model
{
    protected $fillable = [
        'id', 'title', 'created_at', 'category', 'hls_path',
        'description', 'thumbnail', 'site_id', 'views', 'likes'
    ];

    public $timestamps = true;
}
