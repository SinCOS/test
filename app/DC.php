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
        'uid', 'jkje', 'dyxx','hkfs','jkms','sex','hyzk','zgxl','address','yjsr','njsr','imglist','jkqx','content'
    ];

    public function setContentAttribute($pictures)
{
    if (is_array($pictures)) {
        $this->attributes['content'] = json_encode($pictures);
    }
}

public function getContentAttribute($pictures)
{
    return json_decode($pictures, true);
}
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        
    ];
}
