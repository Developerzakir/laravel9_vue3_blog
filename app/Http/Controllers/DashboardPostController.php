<?php

namespace App\Http\Controllers;

use App\Http\Resources\PostResourse;
use Illuminate\Http\Request;
use App\Models\Post;

class DashboardPostController extends Controller
{
    public function index()
    {
        return PostResourse::collection(
            Post::where('user_id', auth()->user()->id)->latest()->get()
        );
    }
}
