<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Banner;
use App\User;
use App\DC;
use App\Library\Pay;
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
        $dclist=  DC::where('status',1)->orderBy('updated_at','desc')->get();
        return view('home',['banner'=>$list,'dc' => $dclist]);
    }
    public function detail($id){
        $detail = DC::find($id);
        if(!$detail){
            return 'error';
        }
        return view('detail',['detail' => $detail]);
    }
    public function apply(){
        return view('apply');
    }
    public function test(){
        $tempOrderId = Pay::getMillisecond();
        Pay::init();
        $result =  Pay::pushOrder(100 * 100,'aliPay',$tempOrderId,'6666',"支付给元",null);
        var_dump($result);
    }
    public function apply_store(Request $request,$id){

       $this->validate($request, [
        'njsr' => 'required',
        'address' => 'required',
        'yjsr' => 'required',
        'zgxl' => 'required',
        'hyzk' => 'required',
        'jkms' => 'required',
        'sex' => 'required',
        'jkje' => 'required',
        'jkqx' => 'required',
        'hkfs' => 'required',
        'dyxx'=> 'required',
        'fcz'=>'required',
           'tdz'=>'required',
            'xsz'=>'required',
           'sfzz'=>'required',
            'sfzf'=>'required',
            'hkb'=>'required',
            'jsz'=>'required',
        ]);
        $data = $request->all();
    
        if($id == 0){
            DC::insert([
                'uid' => \Auth::user()->id,
                'njsr' => $data['njsr'],
                'address' => $data['address'],
                'yjsr' => $data['yjsr'],
                'zgxl' => $data['zgxl'],
                'hyzk' => $data['hyzk'],
                'jkms' => $data['jkms'],
                'jkqx' => $data['jkqx'],
                'sex' => $data['sex'],
                'jkje' => $data['jkje'],
                'hkfs' => $data['hkfs'],
                'dyxx' => $data['dyxx'],
                'fcz' => $data['fcz'],
                'tdz' => $data['tdz'],
                'xsz' => $data['xsz'],
                'sfzz' => $data['sfzz'],
                'sfzf' => $data['sfzf'],
                'hkb' => $data['hkb'],
                'jsz' => $data['jsz'],
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s')
            ]);
        }
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
                $idCardFrontImg = '/images/'.$newName;
                return json_encode($idCardFrontImg);
            }else{
                $idCardFrontImg = '';
                return json_encode($idCardFrontImg);
            }
        }
    }
}
