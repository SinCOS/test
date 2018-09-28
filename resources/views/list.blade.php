@extends('layouts.app')

@section('content')
	<div class="container">
    <div class="row">
    	<div class="col-md-12">
    		<ul class="list-group">
    				 <li class="list-group-item active">我的众筹</li>
    			@foreach ($arrays as $element)
    				 <li class="list-group-item"><a href="/detail/{{$element->id}}"> {{$element->dyxx}}  <span class='pull-right'> ￥{{$element->jkje}} </span></a></li>
    			@endforeach
			</ul>
    	</div>
    </div>
</div>
@endsection