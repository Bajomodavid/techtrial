<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Property extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // create Properties table
        Schema::create('properties', function(Blueprint $table)
        {
            $table->increments("id");
            $table->string("county", 80);
            $table->string("country", 100);
            $table->string("town");
            $table->string("description");
            $table->string("address");
            $table->string("image");
            $table->string("thumbnail");
            $table->double("latitude");
            $table->double("longitude");
            $table->integer("bedrooms");
            $table->integer("bathrooms");
            $table->double("price");
            $table->string("type", 100);
            $table->boolean("for_sale");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
