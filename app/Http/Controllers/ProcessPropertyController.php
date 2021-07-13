<?php

namespace App\Http\Controllers;

use App\Models\Page;
use App\Models\Property;
use App\Models\PropertyType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ProcessPropertyController extends Controller
{
    /**
     * get records for all pages
     */
    public function getPages()
    {
        $types = Page::all();
        $values = [];
        foreach ($types as $key) {
            $values[] = $key->page;
        }
        return $values;
    }

    /**
     * Get data from API
     * @return mixed
     */
    public function fetch(int $page, $url = null)
    {
        $key = config('app.api_key');
        $url = $url ? $url : "https://trial.craig.mtcserver15.com/api/properties?api_key={$key}&page=1&page[number]={$page}";
        $result = Http::get($url);
        $result = json_decode($result->body());
        return $result;
    }

    /**
     * Returns an array of property type objects
     * @return array
     */
    public function getTypes()
    {
        $types = PropertyType::all();
        $values = [];
        foreach ($types as $key) {
            $values[] = $key->id;
        }
        return $values;
    }

    /**
     * Fetch properties from api page and save to DB
     * @return mixed
     */
    public function getRecords(int $page, String $url = null)
    {
        $types = $this->getTypes();
        $pages = $this->getPages();
        $newArray = [];
        $fetchData = $this->fetch($page, $url);
        $result = $fetchData->data;
        foreach ($result as $p) {
            if (in_array($page, $pages)) return;
            if (!in_array($p->property_type_id, $types)) $types = $this->addType([
                'type_id' => $p->property_type->id,
                'title' => $p->property_type->title,
                'description' => $p->property_type->description,
                'created_at' => $p->property_type->created_at,
                'updated_at' => $p->property_type->updated_at,
            ]);
            $newArray[] = [
                'uuid' => $p->uuid,
                'county' => $p->county,
                'country' => $p->country,
                'town' => $p->town,
                'description' => $p->description,
                'address' => $p->address,
                'image' => $p->image_full,
                'thumbnail' => $p->image_thumbnail,
                'latitude' => $p->latitude,
                'longitude' => $p->longitude,
                'bedrooms' => $p->num_bedrooms,
                'bathrooms' => $p->num_bathrooms,
                'price' => $p->price,
                'page' => $page,
                'for_sale' => $p->type,
                'type' => $p->property_type_id,
                'created_at' => $p->created_at,
                'updated_at' => $p->updated_at,
            ];
        }
        Property::insert($newArray);
        $newPage = new Page();
        $newPage->page = $page;
        $newPage->save();
        return $fetchData->next_page_url ? $fetchData->next_page_url : null;
    }

    /**
     * Add property type
     * @return void
     */
    public function addType(array $type)
    {
        PropertyType::create($type);
        return $this->getTypes();
    }
}
