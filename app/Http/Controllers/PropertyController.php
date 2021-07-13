<?php

namespace App\Http\Controllers;

use App\Http\Requests\AddProperty;
use App\Http\Requests\UpdateProperty;
use App\Jobs\ProcessPropertyPage;
use App\Models\Property;
use App\Models\PropertyType;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Image;

class PropertyController extends Controller
{
    public function index()
    {
        // Check if records exist
        $page = request('page') ?? 1;
        $properties = Property::where('page', $page);
        if (!$properties->first()) {
            // Fetch from API
            ProcessPropertyPage::dispatch($page);
        }
        // Post Fetch next page from API
        ProcessPropertyPage::dispatch($page + 1);
        if ($properties) {
            $response = Property::latest();
        } else {
            $response  = $properties::latest();
        }
        $types = PropertyType::all();

        // Filter Request
        if (request('name')) {
            $response->where('description', 'like', '%' . request('name') . '%');
        }
        if (request('bedrooms')) {
            $response->where('bedrooms', request('bedrooms'));
        }
        if (request('bathrooms')) {
            $response->where('bathrooms', request('bathrooms'));
        }
        if (request('type')) {
            $response->where('type', request('type'));
        }
        if (request('for_sale')) {
            $response->where('for_sale', request('for_sale'));
        }
        $response = $response->with("houseType")->paginate(30);
        return view("home", compact('response', 'types'));
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
        if (!$property) return back();
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
        if ($request->image) {
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
        if ($request->image) {
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

        $imageName = time() . '.' . $request->image->extension();

        $img = Image::make($request->image->getRealPath());
        $img->resize(100, 100, function ($constraint) {
            $constraint->aspectRatio();
        })->save(public_path('thumbnails') . '/' . $imageName);

        $request->image->move(public_path('images'), $imageName);
        $image = new \stdClass();
        $image->full = url('images/' . $imageName);
        $image->thumbnail = url('thumbnails/' . $imageName);
        return $image;
    }
}
