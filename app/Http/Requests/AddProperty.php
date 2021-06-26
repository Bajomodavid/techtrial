<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AddProperty extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'county' => 'required',
            'country' => 'required',
            'town' => 'required',
            'description' => 'required',
            'county' => 'required',
            'bedrooms' => 'required',
            'bathrooms' => 'required',
            'price' => 'required',
            'for_sale' => 'required',
            'type' => 'required',
        ];
    }
}
