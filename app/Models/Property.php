<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Property extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'uuid',
        'county',
        'country',
        'town',
        'description',
        'address',
        'image_full',
        'thumbnail',
        'latitude',
        'longitude',
        'bedrooms',
        'bathrooms',
        'price',
        'type',
        'for_sale',
        'created_at',
        'updated_at',
    ];

    public function houseType()
    {
        return $this->hasOne(PropertyType::class, 'id', 'type');
    }
}
