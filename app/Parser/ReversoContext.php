<?php
namespace App\Parser;

use Symfony\Component\DomCrawler\Crawler;
use URL;

class ReversoContext implements ParseContract{
    public $crawler;
    public function getParse($data = null, $translater = 'английский-русский'){
        $ff = 'http://context.reverso.net/'.urlencode('перевод').'/'.urlencode($translater).'/'.urlencode($data);
        $file = file_get_contents($ff);
        /*dd($ff);*/
        $this->crawler = new Crawler($file);
        echo $crawler;
    }
}