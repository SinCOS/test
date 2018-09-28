<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class vOrder extends Model
{
	protected $table = 'dcorder';
	protected $fillable = [
		'uid','money','status','item_id'
	];
	protected $appends = ['item_name'];

	public function setUpdatedAtAttribute($value) {
        
    }
   	
   	public function getItemNameAttribute(){
   		return \App\DC::find($this->item_id)->dyxx;
   	}

    //
}
