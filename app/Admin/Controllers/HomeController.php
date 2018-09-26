<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;

class HomeController extends Controller
{

    public static function first()
    {
        $envs = [
            ['name' => '会员待审核',       'value' => \App\User::where('status','=',0)->sum(),
            ['name' => '会员数',   'value' => \App\User::where('status','=',1)->sum()],
            ['name' => 'VIP数量',               'value' => \App\User::where('vip','>=',\Carbon\Carbon::now())->sum()],
            ['name' => '众筹项目数',             'value' => \App\DC::sum()],
            ['name' => '投标中',            'value' => \App\DC::where('status','=',1)->sum()],

            ['name' => '成功项目数',      'value' => \App\DC::where('status','=',2)->sum()],
            ['name' => '成功筹款',    'value' => \App\vOrder::sum()],
        ];

        return view('admin::dashboard.environment', compact('envs'));
    }
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('Dashboard');
            $content->description('Description...');

            $content->row(Dashboard::title());

            $content->row(function (Row $row) {

                $row->column(4, function (Column $column) {
                    $column->append(self::first());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::extensions());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::dependencies());
                });
            });
        });
    }
}
