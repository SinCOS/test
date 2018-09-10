<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Banner;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
       // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $list =  Banner::orderBy('sort','asc')->get();
    
        return view('home',['banner'=>$list]);
    }
    public function detail(){
        return view('detail');
    }
}
