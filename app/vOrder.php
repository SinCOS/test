<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class vOrder extends Model
{
	protected $table = 'dcorder';
	protected $fill = [
		'no' ,'uid','money','status','item_id'
	];

	public function setUpdatedAtAttribute($value) {
        
    }
    //
}
