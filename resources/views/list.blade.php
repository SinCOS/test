@extends('layouts.app')

@section('content')
	<div class="container">
    <div class="row">
    	<div class="col-md-12">
    		<ul class="list-group">
    			@foreach ($arrays as $element)
    				<li class="list-group-item"><a href="/detail/{{$element->id}}"> {{$element->dyxx}} </a></li>
    			@endforeach
			</ul>
    	</div>
    </div>
</div>
@endsection