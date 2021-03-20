<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAccountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('accounts', function (Blueprint $table) {
            $table->id();
            $table->integer("user_id");
            $table->string("surname")->nullable();
            $table->string("status")->nullable();
            $table->string("phone")->nullable();
            $table->string("show_contacts");
            $table->string("contacts")->nullable();
            $table->string("photo_profile")->nullable();
            $table->string("bg_profile")->nullable();
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
        Schema::dropIfExists('accounts');
    }
}
