<?php

namespace App\Http\Controllers;

use App\Http\Resources\PostResourse;
use Illuminate\Http\Request;
use App\Models\Post;
class HomeController extends Controller
{
    public function index()
    {
        return PostResourse::collection(Post::latest()->take(4)->get());
    }
}
