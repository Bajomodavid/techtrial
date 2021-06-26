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
            $table->string("uuid");
            $table->string("county", 80);
            $table->string("country", 100);
            $table->string("town");
            $table->text("description");
            $table->string("address");
            $table->string("image");
            $table->string("thumbnail");
            $table->string("latitude")->nullable();
            $table->string("longitude")->nullable();
            $table->integer("bedrooms");
            $table->integer("bathrooms");
            $table->integer("page")->default(1);
            $table->double("price");
            $table->tinyInteger("type");
            $table->string("for_sale", 10);
            $table->timestamps();
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
