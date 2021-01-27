<?php

namespace App\Parser;

use Symfony\Component\DomCrawler\Crawler;
use URL;

class GoogleParse implements ParseContract{
    public $crawler;
    
    public function getParse($data = null){
        $arr = [
        'sl' => 'auto',
        'tl' => 'ru',
        'text' => $data,
        'op' => 'translate'
    ];
        $str = http_build_query($arr);
        
        $ff = 'http://translate.google.com/?'.$str;
            
            
       /* $ff = 'http://context.reverso.net/'.urlencode('перевод').'/'.urlencode($translater).'/'.urlencode($data);*/
        $file = file_get_contents($ff);
        /*dd($ff);*/
        $this->crawler = new Crawler($file);
        return $this->crawler->filter('body')->html();
    }
}