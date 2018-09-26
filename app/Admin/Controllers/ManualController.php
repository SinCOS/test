<?php

namespace App\Admin\Controllers;

use App\User;
use Illuminate\Http\Request;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;

class ManualController extends Controller
{
 use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('header');
            $content->description('description');

            $content->body($this->grid());
        });
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header('header');
            $content->description('description');

            $content->body($this->form()->edit($id));
        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function charge()
    {
        return Admin::content(function (Content $content) {

            $content->header('人工充值');
            $content->description('description');

            $content->body($this->form('/admin/manual/charge'));
        });
    }
    public function postCharge(Request $request){
        $this->validate($request,[
            'mobile' => 'required|exists:users',
            'money' => 'required|numeric|min:1'
        ]);
        $user = User::where('mobile','=',$request->input('mobile'))->first();
         if(!$user){
            return '<script>alert("用户不存在");history.go(-1);</script>;';
        }
        $money = doubleval($request->input('money'));
        $user->money +=$money;
        $user->save();
         \DB::table("moneylog")->insert(['uid' =>$user->id,'content' => 
            "后台充值:{$money}",'money' =>$money,'created_at' =>\Carbon\Carbon::now()]);
        return '<script>alert("充值成功");history.go(-1);</script>;';
    }
    public function postRefund(Request $request){
        $this->validate($request,[
           'mobile' => 'required|exists:users',
            'money' => 'required|numeric|max:-1'
        ]);
        $user = User::where('mobile','=',$request->input('mobile'))->first();
        if(!$user){
            return '<script>alert("用户不存在");history.go(-1);</script>;';
        }
        $money = doubleval($request->input('money'));
        $user->money +=$money;
        $user->save();
        \DB::table("moneylog")->insert(['uid' =>$user->id,'content' => 
            "后台扣款:{$money}",'money' =>$money,'created_at' =>\Carbon\Carbon::now()]);
        return '<script>alert("扣款成功");history.go(-1);</script>;';
    }
    public function Refund(){
        return Admin::content(function (Content $content) {

            $content->header('人工扣款');
            $content->description('description');
            $content->body($this->form('/admin/manual/refund'));
        });
    }
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(User::class, function (Grid $grid) {

            $grid->id('ID')->sortable();

            $grid->created_at();
            $grid->updated_at();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form($action)
    {
        return Admin::form(User::class, function (Form $form)use($action) {
            $form->tools(function (Form\Tools $tools) {

                // 去掉返回按钮
                $tools->disableBackButton();

                // 去掉跳转列表按钮
                $tools->disableListButton();

                // 添加一个按钮, 参数可以是字符串, 或者实现了Renderable或Htmlable接口的对象实例
        
            });
            $form->setAction($action);
            $form->text('mobile', '手机号')->rules('required|min:11');
            $form->html("人工操作",'操作');
            $form->currency('money','金额');
        });
    }
}
