<?php

use App\Http\Controllers\PropertyController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [PropertyController::class, 'index']);
Route::get('/delete{id}', [PropertyController::class, 'delete'])->name('delete');
Route::get('/edit{id}', [PropertyController::class, 'edit'])->name('edit');
Route::put('/edit', [PropertyController::class, 'update'])->name('update');
Route::get('/add', [PropertyController::class, 'add'])->name('add');
Route::post('/create', [PropertyController::class, 'create'])->name('create');
