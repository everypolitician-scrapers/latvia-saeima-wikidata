#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://lv.wikipedia.org/wiki/Veidne:12._Saeima',
  xpath: '//li//a[not(@class="new")]/@title',
  after: '//th[contains(.,"Saskaņa")]',
  before: '//th[contains(.,"Beigušās pilnvaras")]',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { lv: names })
