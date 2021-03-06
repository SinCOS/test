<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Ramsey\Uuid\Uuid;
use App\User;
class Order extends Model
{
    protected $table =  'vorder';
    protected $fillable = [
        'no',
        'address',
        'total_fee',
        'uid',
        'paid_at',
        'payment_no',
        'status',
        'created_at',

    ];
    protected $append = [
        'total_money'
    ];
    protected $dates = [
        'paid_at'
    ];
    public function setUpdatedAtAttribute($value) {
        
    }
     public function getTotalMoneyAttribute(){
        $id = $this->attributes['id'];
        return \App\vOrder::where('item_id','=',$id)->where('status','=','1')->sum('money') ?: 0.00;

    }
    protected static function boot()
    {
        parent::boot();
        // 监听模型创建事件，在写入数据库之前触发
        static::creating(function ($model) {
            // 如果模型的 no 字段为空
            if (!$model->no) {
                // 调用 findAvailableNo 生成订单流水号
                $model->no = static::findAvailableNo();
                // 如果生成失败，则终止创建订单
                if (!$model->no) {
                    return false;
                }
            }
        });
    }
    public function user(){
        return $this->belongsTo(User::class,'uid','id');
    }
    public static function findAvailableNo()
    {
        // 订单流水号前缀
        $prefix = date('YmdHis');
        for ($i = 0; $i < 10; $i++) {
            // 随机生成 6 位的数字
            $no = $prefix.str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);
            // 判断是否已经存在
            if (!static::query()->where('no', $no)->exists()) {
                return $no;
            }
            usleep(100);
        }
        \Log::warning(sprintf('find order no failed'));

        return false;
    }
    //
}
