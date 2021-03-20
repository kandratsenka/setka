<?php

use Illuminate\Support\Facades\Route;
use Auth0\Login\Auth0Controller;
use App\Http\Controllers\Auth\Auth0IndexController;
use App\Http\Controllers;

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
 /*Route::get('/auth0/callback', [Auth0Controller::class, 'callback'])->name('auth0-callback');
 Route::get('auth0/login', [Auth0IndexController::class, 'login'])->name('authlogin');*/
 Route::get('auth/login', [Controllers\Auth\AuthController::class,'login']);
 /*Route::get('auth0/logout', [Auth0IndexController::class, 'logout'])->name('authlogout');*/
 Route::get('auth/logout', [Controllers\Auth\AuthController::class,'logout']);
 Route::get('auth/token', [Controllers\Auth\AuthController::class,'token']);
 Route::get('auth/tokenId', [Controllers\Auth\AuthController::class,'tokenId']);
 Route::get('auth/me',[Controllers\Auth\AuthController::class, 'me']);
 Route::get('/public/{id}',[Controllers\PublicationController::class, 'getPublication']);
 Route::get('/json/property',[Controllers\JsonController::class, 'getProfile']);
 Route::get('/file/property',[Controllers\JsonController::class, 'getFile']);
 
    
 Route::group(['middleware' => ['login','lang']], function () {
        /*Route::get('/logout', [Auth0IndexController::class, 'logout'])->name('authlogout');*/
    /*Route::get('/profile', [Auth0IndexController::class, 'profile'])->name('profile');*/
    Route::post('upload',[Controllers\CKEditorController::class,'uploadImage'])->name('upload');
    Route::post('/account', [Controllers\AccountController::class, 'postIndex']);
    Route::post('/account/bg', [Controllers\AccountController::class, 'postBg']);
    Route::post('/publication',[Controllers\PublicationController::class,'postIndex']);
    Route::post('/properties/add',[Controllers\PropertiesController::class,'postIndex']);
    Route::post('/galery/add',[Controllers\GaleryController::class,'postAdd']);
    Route::post('/friends/search',[Controllers\FriendsSearchController::class,'postIndex']);
    Route::post('/message/{id}',[Controllers\MessagesController::class,'postIndex']);
    Route::post('/messages',[Controllers\MessagesController::class,'postSend']);
    Route::post('/ajax/translater',[Controllers\Ajax\TranslateController::class, 'postData']);
    Route::get('/ajax/component/friends',[Controllers\Ajax\ComponentController::class, 'getFriends']);
    Route::post('/ajax/bg_profile',[Controllers\AjaxController::class, 'getBg']); 
    Route::post('/publication/edit/{publication}',[Controllers\PublicationController::class, 'postEdit']);
    Route::post('/complain',[Controllers\ComplainController::class, 'postComplain']); 
    Route::get('/publication/edit/{publication}',[Controllers\PublicationController::class, 'getEdit']);
    Route::get('/',[Controllers\BaseController::class,'getIndex'])->middleware('sort'/*,'lang'*/);
    Route::get('/net',[Controllers\NetController::class,'getIndex']);
    Route::get('/net/friends',[Controllers\NetController::class,'getFriends']);
    Route::get('/messages',[Controllers\MessagesController::class,'getIndex']);
    Route::get('/message/{id}',[Controllers\MessagesController::class,'getMessage']);
    Route::get('/profile/{id?}',[Controllers\ProfileController::class,'getIndex']);
    Route::get('/properties',[Controllers\PropertiesController::class,'getIndex']);
    Route::get('/galery/{id}',[Controllers\GaleryController::class,'getIndex']);
    Route::get('/friends/add',[Controllers\NetController::class,'getAdd']);
    Route::get('/friend/add/{id}',[Controllers\NetController::class,'getAddOne']);
    Route::get('/friend/delete/{id}',[Controllers\NetController::class,'getDeleteOne']);
});
    



Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::post('/home/main', [Controllers\HomeController::class, 'postMain']);


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

//данный маршрут всегда должен быть последним
Route::get('{url}',[Controllers\BaseController::class,'getText']);

