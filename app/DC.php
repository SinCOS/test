<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DC extends Model
{
    protected $table = 'DC';//借贷
        /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'uid', 'vip_money', 'money','deadline','description','status','thumb'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        
    ];
}
