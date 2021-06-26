<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddProperty;
use App\Http\Requests\UpdateProperty;
use App\Models\Page;
use App\Models\Property ;
use App\Models\PropertyType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Image;

class PropertyController extends Controller
{
    public function index() {
        // Check if records exist
        $page = request('page') ?? 1;
        $properties = Property::where('page', $page);
        if(!$properties->first()) {
            // Fetch from API
            $properties = $this->getRecords($page);
            $this->getRecords($page+1);
        }
        // Post Fetch next page from API
        $this->getRecords($page+1);
        if($properties) {
            $response = Property::latest();
        }
        else {
            $response  = $properties::latest();
        }
        $types = PropertyType::all();

        // Filter Request
        if(request('name')) {
            $response->where('description', 'like', '%'. request('name') . '%');
        }
        if(request('bedrooms')) {
            $response->where('bedrooms', request('bedrooms'));
        }
        if(request('bathrooms')) {
            $response->where('bathrooms', request('bathrooms'));
        }
        if(request('type')) {
            $response->where('type', request('type'));
        }
        if(request('for_sale')) {
            $response->where('for_sale', request('for_sale'));
        }
        $response = $response->with("houseType")->paginate(30);
        return view("home", compact('response', 'types'));
    }

    // Get Request Types
    public function getTypes()
    {
        $types = PropertyType::all();
        $values = [];
        foreach ($types as $key ) {
            $values[] = $key->id;
        }
        return $values;
    }

    // Get Packages
    public function getPages() {
        $types = Page::all();
        $values = [];
        foreach ($types as $key ) {
            $values[] = $key->page;
        }
        return $values;
    }

    // Fetch API records
    public function getRecords($page)
    {
        $key = env('API_KEY');
        $url = "https://trial.craig.mtcserver15.com/api/properties?api_key={$key}&page=1&page[number]={$page}";
        $result = Http::get($url);
        $result = json_decode($result->body());
        $result = $result->data;
        $types = $this->getTypes();
        $pages = $this->getPages();
        $newArray = [];

        foreach($result as $p) {
            if(in_array($page, $pages))return;
            if(!in_array($p->property_type_id, $types)) $types = $this->addType($p->property_type);
            $property = new \stdClass();
            $property->uuid = $p->uuid;
            $property->county = $p->county;
            $property->country = $p->country;
            $property->town = $p->town;
            $property->description = $p->description;
            $property->address = $p->address;
            $property->image = $p->image_full;
            $property->thumbnail = $p->image_thumbnail;
            $property->latitude = $p->latitude;
            $property->longitude = $p->longitude;
            $property->bedrooms = $p->num_bedrooms;
            $property->bathrooms = $p->num_bathrooms;
            $property->price = $p->price;
            $property->page = $page;
            $property->for_sale = $p->type;
            $property->type = $p->property_type_id;
            $property->created_at = $p->created_at;
            $property->updated_at = $p->updated_at;

            $newArray[] = (array)$property;
        }
        Property::insert($newArray);
        $newPage = new Page();
        $newPage->page = $page;
        $newPage->save();
        return Property::where('page', $page);
    }

    // Add property type and return list of types
    public function addType($type) {
        PropertyType::create((array)$type);
        return $this->getTypes();
    }

    // Delete record
    public function delete($id)
    {
        Property::where('id', $id)->delete();
        return back();
    }

    public function edit($id)
    {
        $property = Property::where('id', $id)->first();
        if(!$property) return back();
        $types = PropertyType::all();
        return view('edit', compact('property', 'types'));
    }

    public function add()
    {
        $types = PropertyType::all();
        return view('add', compact('types'));
    }

    // Update record
    public function update(UpdateProperty $request)
    {
        $property = Property::where('id', $request->id)->first();
        if($request->image) {
            $image = $this->imageUpload($request);

            $property->image = $image->full;
            $property->thumbnail = $image->thumbnail;
        }

        $property->county = $request->county;
        $property->country = $request->country;
        $property->town = $request->town;
        $property->description = $request->description;
        $property->address = $request->county;
        $property->bedrooms = $request->bedrooms;
        $property->bathrooms = $request->bathrooms;
        $property->price = $request->price;
        $property->for_sale = $request->for_sale;
        $property->type = $request->type;
        $property->save();
        return back()->with('success', 'Property Updated successfully');
    }

    // Create Record
    public function create(AddProperty $request)
    {
        $property = new Property();
        if($request->image) {
            $image = $this->imageUpload($request);

            $property->image = $image->full;
            $property->thumbnail = $image->thumbnail;
        }

        $uuid = Str::uuid()->toString();

        $property->county = $request->county;
        $property->country = $request->country;
        $property->town = $request->town;
        $property->uuid = $uuid;
        $property->description = $request->description;
        $property->address = $request->county;
        $property->bedrooms = $request->bedrooms;
        $property->bathrooms = $request->bathrooms;
        $property->price = $request->price;
        $property->for_sale = $request->for_sale;
        $property->type = $request->type;
        $property->save();
        return back()->with('success', 'Property Added successfully');
    }

    // Upload Image
    public function imageUpload(Request $request)
    {
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:8000',
        ]);

        $imageName = time().'.'.$request->image->extension();

        $img = Image::make($request->image->getRealPath());
        $img->resize(100, 100, function ($constraint) {
            $constraint->aspectRatio();
        })->save(public_path('thumbnails').'/'.$imageName);

        $request->image->move(public_path('images'), $imageName);
        $image = new \stdClass();
        $image->full = url('images/'.$imageName);
        $image->thumbnail = url('thumbnails/'.$imageName);
        return $image;
    }
}
