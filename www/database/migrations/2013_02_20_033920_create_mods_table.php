<?php

use Illuminate\Database\Migrations\Migration;

class CreateModsTable extends Migration {

	/**
	 * Make changes to the database.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('mods', function($table) {
			$table->increments('id');
			$table->string('name', 191)->unique();
			$table->text('description')->nullable();
			$table->string('author')->nullable();
			$table->string('link')->nullable();
			$table->nullableTimestamps();
		});
	}

	/**
	 * Revert the changes to the database.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('mods');
	}

}