<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Banner;
use App\User;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
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
    public function apply(){
        return view('apply');
    }
    public function apply_store(){
        return ['status' => 0];
    }
    public function home(){
        $user = \Auth::user();
        return view('usercenter',['user' => $user]);
    }
    public function uploadimg(Request $request)
    {
  
        if($request->isMethod('post'))
        {
      
            $file =  $request->file('avatar');
            
            if($file){
                $extension = $file->guessExtension();
                $newName = str_random(18).".".$extension;
                $file->move(base_path().'/public/uploads/images/',$newName);
                $idCardFrontImg = '/uploads/images/'.$newName;
                return json_encode($idCardFrontImg);
            }else{
                $idCardFrontImg = '';
                return json_encode($idCardFrontImg);
            }
        }
    }
}
