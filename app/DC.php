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
        'uid', 'jkje', 'dyxx','hkfs','jkms','sex','hyzk','zgxl','address','yjsr','njsr','imglist','jkqx'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        
    ];
}
