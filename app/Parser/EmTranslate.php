<?php

namespace App\Parser;

use Symfony\Component\DomCrawler\Crawler;
use Http;

class EmTranslate implements ParseContract{
    public $crawler;
    
    public function getParse($data = null){
        $response = Http::post('http://tetran.ru/OnLineTranslator', [
            'SourceTextField' => $data,
            'SourceLang' => 'en',
            'TargetLang' => 'ru'
]);
       /* $ff = '/OnLineTranslator'.$str;*/
        /*$file = file_get_contents($response);*/
        
        $this->crawler = new Crawler($response->body());
        return $this->crawler->filter('#targetField')->text();
    }
}
