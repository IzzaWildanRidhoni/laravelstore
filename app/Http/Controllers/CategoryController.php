<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        // $categories = \App\Models\Category::paginate(10);
        // return view('categories.index',['categories'=>$categories]);
       
        $categories = \App\Models\Category::paginate(10);

        $filterKeyword=$request->get('name');
        if ($filterKeyword) {
            $categories = \App\Models\Category::where("name","LIKE","%$filterKeyword%")->paginate(10);
        }

        return view('categories.index',['categories'=>$categories]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('categories.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $name =$request->get('name');

        $new_category = new \App\Models\Category;
        $new_category->name =$name;

        if ($request->file('image')) {//apakah ada request bertipe file dengan nama image?
            $image_path = $request->file('image')->store('category_image','public');//jika ada simpan ke folder categori_iamge

            $new_category->image = $image_path;
        }

        $new_category->created_by = \Auth::user()->id;//mengambil id user yang sedang login
        $new_category->slug = Str::slug($name,'-');//misal sepatu olahraga menjadi sepatu-olahraga
        $new_category->save();

        return redirect()->route('categories.create')->with('status','category successfully created');
;    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $category = \App\Models\Category::findOrFail($id);

        return view('categories.show',['category'=>$category]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category_to_edit =\App\Models\Category::findOrFail($id);

        return view('categories.edit',['category'=>$category_to_edit]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $name = $request->get('name');
        $slug = $request->get('slug');

        $category =\App\Models\Category::findOrFail($id);
        $category->name=$name;
        $category->slug=$slug;

        if ($request->file('image')) {
            if ($category->image && file_exists(storage_path('app/public/'.$category->image))) {
                \Storage::delete('public/'.$category->image);
            }

            $new_image = $request->file('image')->store('category_image','public');
            $category->image=$new_image;

        }
        $category->updated_by=\Auth::user()->id;
        $category->slug = \Str::slug($name);
        $category->save();

        return redirect()->route('categories.edit',[$id])->with('status','Category successfully updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = \App\Models\Category::findOrfail($id);
        $category->delete();

        return redirect()->route('categories.index')->with('status','category successfully moved to trash');
    }

    public function trash()
    {
        $deleted_category =\App\Models\Category::onlyTrashed()->paginate(10);//menampilkan data yang statusnya softdelete yg fild deleted-at tidal nul

        return view('categories.trash',['categories'=>$deleted_category]);
    }

    public function restore($id)
    {
        $category =\App\Models\Category::withTrashed()->findOrfail($id);

        if ($category->trashed()) {
            $category->restore();
        }else{
            return redirect()->route('categories.index')->with('status','Cartegory is not in trash');
        }
        return redirect()->route('categories.index')->with('status','Cartegory successfully restored');
    }

    public function deletePermanent($id)
    {
        $category = \App\Models\Category::withTrashed()->findOrFail($id);

        if (!$category->trashed()) {//cek apakah tidak di tong sampah ?
            return redirect()->route('categories.index')->with('status','can not delete permanent active category');
        }else{
            // jika di tong sampah maka hapus
            $category->forceDelete();

            return redirect()->route('categories.index')->with('status','category permanently deleted');
        }
    }
}
