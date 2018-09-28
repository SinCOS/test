<?php

namespace App\Admin\Controllers;

use App\Banner;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;

class BannerController extends Controller
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
        return Admin::grid(Banner::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->column('link','链接')->display(function($link){
                return "<a href='{$link}' target='_blank' >{$link}</a>";
            });
            $grid->column('title','公告标题');
            $grid->column('pic','图片')->display(function($pic){
                return "<a href='/uploads/{$pic}' target='_blank'><img src='/uploads/{$pic}'  width='64' height='64'/></a>";
            });
            $grid->created_at();
          //  $grid->updated_at();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(Banner::class, function (Form $form) {

            $form->display('id', 'ID');
            $form->image('pic','图片')->uniqueName();
            $form->text('link','链接')->rules('required');
            $form->text('title','标题');
            $form->number('sort','排序');
            $form->select('type','类型')->options([
                 0 => '轮播',
                1 => '公告'
            ]);
            $form->switch('status','状态');
            $form->display('created_at', 'Created At');
         //   $form->display('updated_at', 'Updated At');
        });
    }
}
