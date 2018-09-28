<?php

namespace App\Admin\Controllers;

use App\DC;
use App\vOrder;
use App\User;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;

class DCController extends Controller
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

            $content->header('借贷审核');
            $content->description('description');

            $content->body($this->grid());
        });
    }

    public function userGrid($object){
        return Admin::grid(vOrder::class, function (Grid $grid)use($object) {
                        $grid->actions(function ($actions) {
                                $actions->disableDelete();
                                $actions->disableEdit();
                                // $actions->append("<a href=\"debit-credit/users/{$actions->row['id']}\"><i class=\"fa fa-eye\"></i></a>");
                           // $actions->disableView();
                         });
                         $grid->model()->where('item_id','=',$object->id);
                         $grid->disableCreateButton();
                         $grid->id('ID')->sortable();
                         $grid->column('uid','用户名')->display(function($userId){
                             return User::find($userId)->name ;
                        });
                        $grid->column('money','投标金额');
                        $grid->column('created_at','投标时间');

                        $grid->column('预期收益')->display(function()use($object){
                                return $this->money * (100+$object->ll)/100;
                        });
                });

    }
    public function show($id){
        $object = DC::find($id);
        return Admin::content(function(Content $content)use($object){
            $content->header('投标信息');
            $content->description('');
            $content->body($this->userGrid($object));

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

            $content->header('查看');
            $content->description('description');
        
            $content->body($this->form()->edit($id));
        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('添加');
            $content->description('description');

            $content->body($this->form());
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(DC::class, function (Grid $grid) {
            $grid->model()->orderBy('updated_at','desc');
            $grid->disableCreateButton();
           // $grid->disableRowSelector();
            $grid->filter(function($filter){
                $filter->equal('status','状态')->select(['1'=>'正在投标','0'=>'未审核','-1'=>'未通过','2' => '投标完成']);
            });
            $grid->actions(function ($actions) {
               // $actions->disableDelete();
                //$actions->disableEdit();
                    $actions->append("<a href=\"debit-credit/users/{$actions->row['id']}\"><i class=\"fa fa-eye\"></i></a>");
               // $actions->disableView();
            });
            $grid->id('ID')->sortable();
            $grid->column('uid','用户名')->display(function($userId){
                return User::find($userId)->name ;
            });
            $grid->column('dyxx','抵押信息');
            $grid->column('jkje','借款金额');
            $grid->column('ll','利率');
             $grid->column('jkqx','借款期限(月)');
            $grid->column('total_money','已筹集');
           
            $grid->updated_at('最后更新');
            $states = [
                'on'  => ['value' => 1, 'text' => '打开', 'color' => 'primary'],
                'off' => ['value' => 2, 'text' => '关闭', 'color' => 'default'],
            ];
             $grid->status('审核')->display(function($status){
                $config = [
                    1 => '正在投标',
                    2 => '投标完成',
                    -1 => '审核失败',
                    0 => '待审核'
                ];
                return $config[$status];
             });
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(DC::class, function (Form $form) {

            $form->display('id', 'ID');
            $form->display('uid','用户')->with(function($val){
                return User::find($val)->name;
            });
            $form->display('uid','VIP')->with(function($val){
                return User::find($val)->vip >=\Carbon\Carbon::now() ? '是': '否';
            });
            $form->display('uid','手机号码')->with(function($val){
                return User::find($val)->mobile ;
            });
            $form->image('xybg','信用报告')->uniqueName();
            $form->image('xsz','行驶证')->uniqueName();
            $form->image('sfzz','身份证正面')->uniqueName();
            $form->image('sfzf','身份证反面')->uniqueName();
            $form->image('fcz','房产证')->uniqueName();
            $form->multipleImage('content','附加内容')->removable();
            //  $form->image('jsz','驾驶证')->uniqueName();
            $form->number('ll','借款利率')->rules('min:0');
            $form->display('jkje','借款金额');
            $form->display('jkqx','借款期限');
            $form->display('dyxx','抵押信息');
            $form->display('hkfs','还款方式');
            $form->display('jkms','借款描述');
            $form->display('yjsr','月均收入');
            $form->display('njsr','年均收入');
            $form->display('hyzk','婚姻状况');
            $form->display('zgxl','最高学历');
            $form->display('address','居住地址');
            $form->select('status','状态')->options(['1'=>'通过','0'=>'未审核','-1'=>'未通过','2' => '投标完成']);
            $form->display('updated_at', '申请时间');
        });
    }
}
