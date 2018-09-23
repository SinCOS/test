<?php

namespace App\Admin\Controllers;

use App\User;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;

class UserController extends Controller
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

            $content->header('用户列表');
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
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('用户列表');
            $content->description('');

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
        return Admin::grid(User::class, function (Grid $grid) {
            $grid->disableCreateButton();
            $grid->id('ID')->sortable();
            $grid->column('name');
            $grid->column('mobile','手机');
            $grid->column('money','余额');
            $grid->column('vip','是否会员')->display(function($vip){
                return $vip >\Carbon\Carbon::now()  ? "<span>是</span><br><span>{$vip}</span>" :  '否';
            });
            
            $grid->column('status','审核')->display(function($status){
                return $status == 1 ?'通过':'未通过';
            });
            $grid->created_at('注册时间');
            //$grid->updated_at();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(User::class, function (Form $form) {

            $form->display('id', 'ID');
            $form->text('name','用户名');
            $form->password('password','密码')->rules('required');;
            $form->text('mobile','手机');
            $form->display('money','余额');
             $form->select('status','状态')->options(['1'=>'通过','0'=>'未审核','-1'=>'未通过']);
            $form->display('created_at', '注册时间');
            //$form->display('updated_at', 'Updated At');
            $form->disableReset();
            $form->saving(function(Form $form){
                if ($form->password && $form->model()->password != $form->password) {
                    $form->password = bcrypt($form->password);
                }
            });
        });
    }
}
