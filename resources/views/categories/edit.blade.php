@extends('layouts.global')

@section('title')
    Edit Category
@endsection

@section('content')
    <div class="col-md-8">
        {{-- flash message --}}
        @if (session('status'))
            <div class="alert alert-success">
                {{session('status')}}
            </div>
        @endif
        {{-- akhir flash message --}}

        <form action="{{ route('categories.update', [$category->id]) }}" enctype="multipart/form-data" method="POST" class="bg-white shadow-sm p-3">
            @csrf
            <input type="hidden" value="PUT" name="_method">

            <label>Category Name</label>
            <input type="text" class="form-control {{$errors->first('name') ? "is-invalid" :""}}" value="{{$category->name}}" name="name" value="{{old('name') ? old('name') : $category->name}}" >
            <div class="invalid-feedback">
                {{$errors->first('name')}}
            </div>
            <br><br>
            
            <label>Category Slug</label>
            <input type="text" class="form-control {{$errors->first('slug') ? "is-invalid" :""}}" value="{{$category->slug}}" name="slug" value="{{old('slug') ? old('slug') : $category->slug}}">
            <div class="invalid-feedback">
                {{$errors->first('slug')}}
            </div>
            <br><br>
            
            <label>Category Image</label>
            @if ($category->image)
                <span>Current Image</span><br>
                <img src="{{ asset('storage/'.$category->image) }}" width="120px" alt=""><br><br>
            @endif

            <input type="file" class="form-control {{$errors->first('image') ? "is-invalid" :""}}" name="image">
            <small class="text-muted">Kosongkan jika tidak ingin diubah gambarnya</small>
            <div class="invalid-feedback">
                {{$errors->first('image')}}
            </div>
            <br><br>

            <input type="submit" class="btn btn-primary" value="update">
        </form>
    </div>
@endsection