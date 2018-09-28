@extends('layouts.app')

@section('content')
	<div class="container">
    <div class="row">
    	<div class="col-md-12">
    		<ul class="list-group">
    				 <li class="list-group-item active">{{$title}}}</li>
 				@if ($type == 'dc')
 					@foreach ($arrays as $element)
    					 <li class="list-group-item"><a href="/detail/{{$element->id}}"> {{$element->dyxx}}  <span class='pull-right'>申请:￥{{$element->jkje}} </span></a></li>
    				@endforeach
    			@else
    				@foreach ($arrays as $element)
    					 <li class="list-group-item"><a href="/detail/{{$element->item_id}}"> {{$element->created_at}}  <span class='pull-right'> 投:￥{{$element->money}} </span></a></li>
    				@endforeach
 				@endif
    			
			</ul>
    	</div>
    </div>
</div>
@endsection