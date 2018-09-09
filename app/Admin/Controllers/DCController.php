<?php

namespace App\Admin\Controllers;

use App\DC;
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
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('header');
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
            $grid->disableCreateButton();
            $grid->disableRowSelector();
            $grid->actions(function ($actions) {
               // $actions->disableDelete();
                $actions->disableEdit();
        
               // $actions->disableView();
            });
            $grid->id('ID')->sortable();
            $grid->column('uid','用户名')->display(function($userId){
                
                return User::find($userId)->name;
            });
            $grid->column('description','描述');
           
            $grid->created_at('创建时间');
            $grid->updated_at('最后更新');
             $grid->column('status','审核')->editable('select', [1 => '审核通过', -1 => '审核失败', 0 => '未审核']);
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
            $form->switch('status','状态');
            $form->display('created_at', 'Created At');
            $form->display('updated_at', 'Updated At');
        });
    }
}
