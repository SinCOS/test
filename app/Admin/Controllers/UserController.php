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
            $grid->status('审核')->editable('select', [1 => '审核通过', -1 => '审核失败', 0 => '未审核']);
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
            $form->password('password','密码');
            $form->email('mobile','手机');
            $form->display('money','余额');
            $form->display('created_at', '注册时间');
            //$form->display('updated_at', 'Updated At');
            $form->disableReset();
            $form->saving(function(Form $form){
                if($form->password && $form->model()->password != $form->password){
                    $form->password = bcrypt($form->password);
                }
            });
        });
    }
}
