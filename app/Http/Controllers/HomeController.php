<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Banner;
use App\User;
use App\DC;
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
    public function test(){
        if(isset($_SESSION['openid'])){
            return 'ok';
        }
        
    }
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
        $user = \Auth::user();
        if($user->status !=1){
            return '请在管理员审核之后，再次进行登录!';
        }
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
        //    'tdz'=>'required',
            'xsz'=>'required',
           'sfzz'=>'required',
            'sfzf'=>'required',
            'xybg'=>'required',
            // 'jsz'=>'required',
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
                'xybg' => $data['xybg'],
                'xsz' => $data['xsz'],
                'sfzz' => $data['sfzz'],
                'sfzf' => $data['sfzf'],
                // 'hkb' => $data['hkb'],
                // 'jsz' => $data['jsz'],
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s')
            ]);
        }
    }
    public function home(){
        $user = \Auth::user();
        $weiUser = session('wechat.oauth_user.default'); // 拿到授权用户资
        $item = DC::where('uid','=',$user->id)->first();
        return view('usercenter',['user' => $user,'weiUser'=>$weiUser,'isStatus' => $item,'vip' => ($user->vip > \Carbon\Carbon::now())]);
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
