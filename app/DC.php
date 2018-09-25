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
    protected $appends = ['total_money'];

    public function setContentAttribute($pictures)
{
    if (is_array($pictures)) {
        $this->attributes['content'] = json_encode($pictures);
    }
}
     public function getTotalMoneyAttribute(){
        $id = $this->attributes['id'];
        return \App\vOrder::where('item_id','=',$id)->where('status','=','1')->sum('money') ?: 0.00;

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
