<?php

use App\Build;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TestSeeder extends Seeder
{

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //$this->call('UserTableSeeder');
        $this->call('ModpackTableTestSeeder');
        $this->call('ModTableTestSeeder');
        $this->call('ClientTableTestSeeder');
        $this->call('KeyTableTestSeeder');

        DB::table('build_modversion')->delete();

        $testbuild = Build::find(1);

        //Add testmodversion to testbuild
        $testbuild->modversions()->attach(1);
    }

}
