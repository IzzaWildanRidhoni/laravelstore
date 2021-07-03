@extends('layouts.global')

@section('title')
    Create Category 
@endsection

@section('content')

    <div class="col-md-8">
        {{-- flash message --}}
        @if (session('status'))
            <div class="alert alert-success">
                {{session('status')}}
            </div>
        @endif
        {{--akhir flash message --}}

        <form method="POST" action="{{ route('categories.store') }}" enctype="multipart/form-data" class="bg-white shadow-sm p-3">
            @csrf
            <label >Category name</label>
            <input type="text" class="form-control" name="name"><br>
            <label >Category Image</label>
            <input type="file" class="form-control" name="image"><br><br>
            
            <input type="submit" class="btn btn-primary" value="Save">
        </form>
    </div>
@endsection