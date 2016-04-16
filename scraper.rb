#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names_12 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://lv.wikipedia.org/wiki/Veidne:12._Saeima',
  xpath: '//li//a[not(@class="new")]/@title',
  after: '//th[contains(.,"Deputāti")]',
  before: '//th[contains(.,"Saistītie raksti")]',
) 

names_11 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://lv.wikipedia.org/wiki/Veidne:11._Saeima',
  xpath: '//li//a[not(@class="new")]/@title',
  after: '//th[contains(.,"Deputāti")]',
  before: '//th[contains(.,"Saistītie raksti")]',
) 

names_10 = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://lv.wikipedia.org/wiki/Veidne:10._Saeima',
  xpath: '//li//a[not(@class="new")]/@title',
  after: '//th[contains(.,"Deputāti")]',
  before: '//th[contains(.,"Saistītie raksti")]',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { lv: names_12 | names_11 | names_10 })
