@extends('layouts.global')

@section('title')
    Category list
@endsection

@section('content')

    {{-- filter --}}
    <div class="row">
        <div class="col-md-6">
            <form action="{{ route('categories.index') }}">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Filter by category name" name="name">
                    <input type="submit" value="filter" class="btn btn-primary">
                </div>
            </form>
        </div>

        <div class="col-md-6">
            <ul class="nav nav-pills card-header-pills">
                <li class="nav-item">
                    <a href="{{ route('categories.index') }}" class="nav-link active">Published</a>
                </li>
                <li class="nav-item">
                    <a href="{{ route('categories.trash') }}" class="nav-link">Trash</a>
                </li>
            </ul>
        </div>
    </div>
    <hr class="my-3">


    {{-- content --}}
    <div class="row">
        <div class="col-md-12">
            {{-- flash message --}}
            @if(session('status'))
                <div class="row">
                    <div class="col-md-12">
                        <div class="alert alert-warning">
                            {{session('status')}}
                        </div>
                    </div>
                </div>
            @endif
            {{-- akhir flash message --}}
                
            {{-- btn create --}}
            <div class="row mb-3">
                <div class="col-md-12 text-right">
                    <a href="{{ route('categories.create') }}" class="btn btn-primary">Create Category</a>
                </div>
            </div>
            {{-- akhir btn create --}}
            <table class="table table-bordered table-stripped">
                <thead>
                    <tr>
                        <th><b>Name</b></th>
                        <th><b>Slug</b></th>
                        <th><b>Image</b></th>
                        <th><b>Actions</b></th>
                    </tr>
                </thead>

                <tbody>
                    @foreach ($categories as $category)
                        <tr>
                            <td>{{$category->name}}</td>
                            <td>{{$category->slug}}</td>
                            <td>
                                @if ($category->image)
                                    <img src="{{ asset('storage/'.$category->image) }}" width="70px" alt="">
                                @else
                                    No Image
                                @endif
                            </td>
                            <td>
                                <a href="{{ route('categories.edit', [$category->id]) }}" class="btn btn-info btn-sm">Edit</a>
                                <a href="{{ route('categories.show', [$category->id]) }}" class="btn btn-info btn-sm">Show</a>
                                <form  class="d-inline"action="{{ route('categories.destroy', [$category->id]) }}" method="POST" onsubmit="return confirm('Move category to trash ? ')">
                                    @csrf
                                    <input type="hidden" value="DELETE" name="_method">
                                    <input type="submit" class="btn btn-danger btn-sm" value="Trash">
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
                
                <tfoot>
                    <tr>
                        <td colspan="10">
                            {{$categories->appends(Request::all())->links()}}
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
@endsection