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
    public function check(){
        $user = \Auth::user();
        if($user->status !=1){
            echo '<script>alert("您的申请已经提交,系统将在24小时内审核!");</script>';
            exit();
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
       $this->check();
        $list =  Banner::where('type','=',0)->orderBy('sort','asc')->get();
        $msg = Banner::where('type','=',1)->first();

        $dclist=  DC::where('status',1)->orderBy('updated_at','desc')->get();
        return view('home',['banner'=>$list,'dc' => $dclist,'msg' =>$msg]);
    }
    public function detail($id){
         $this->check();
        $detail = DC::find($id);
        if(!$detail){
            return 'error';
        }
        return view('detail',['detail' => $detail]);
    }
    public function apply(){
         $this->check();
        return view('apply');
    }
    public function order(Request $request,$itemId){
        $money = $request->input('money');
        $password = $request->input('password');
        $user = \Auth::user();
        if(!password_verify($password,$user->password)){
            return response()->json(['status'=> 0,'errMsg' => '密码错误'],403);
        }
        $item = DC::find($itemId);
        if(!$item||$item->status ==2 ||$item->total_money >= $item->jkje){
            return response()->json(['status' => 0,'errMsg' => 
                '此单已完成投标'],403);
        }
        if($money > $user->money){
            return response()->json(['status' => 0,'errMsg' => 
                '当前余额不够，请联系管理员充值'],403);
        }
        if($money + $item->total_money > $item->jkje){
            return response()->json(['status' => 0,'errMsg' => 
                '投标金额超出投标范围'],403);
        }
        \DB::beginTransaction();
        try{
            if($money + $item->total_money >= $item->jkje){
               // \DB::table('dc')->where('id','=',$item->id)->update(['status' => 2]);decrement('')
                $item->status = 2;
                $item->save();
            }
            \App\vOrder::create([
                'uid' => $user->id,
                'money' => $money,
                'item_id' => $itemId,
                'status' => 1,
            ]);
            $user->money -= $money;
            $user->save();
            \DB::table("moneylog")->insert(['uid' =>$user->id,'content' => 
            "投标号:{$item->id} 投标金额:{$money}",'money'=>-$money,'created_at' =>\Carbon\Carbon::now()]);
            \DB::commit();
        }catch(\Exception $ex ){
            \DB::rollback();
            return response()->json(['status' => 0,'errMsg'=>$ex->getMessage()],403);
        }
        return response()->json(['status' => 1,'errMsg'=>'已提交']);

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
            return response()->json(['status' =>1]);
        }
        return response()->json(['status' =>0]);
    }
    public function home(){
         $this->check();
        $user = \Auth::user();
        $weiUser = session('wechat.oauth_user.default'); // 拿到授权用户资
        $item = DC::where('uid','=',$user->id)->first();
        return view('usercenter',['user' => $user,'weiUser'=>$weiUser,'isStatus' => $item,'vip' => ($user->vip > \Carbon\Carbon::now())]);
    }
    public function DCItem($type){
        $this->check();
        $user = \Auth::user();
        if($type == 'dc'){
            $list = DC::where('uid','=',$user->id)->orderBy('created_at','desc')->get();
            $title = '我的众筹';
        }else{
            $list = \App\vOrder::where('uid','=',$user->id)->orderBy('created_at','desc')->get();
            $title = '我的投标';
        }
        return view('list',['arrays' => $list,'title' =>$title,'type' =>$type]);
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
