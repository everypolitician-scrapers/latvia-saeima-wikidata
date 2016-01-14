#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'
require 'pry'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://lv.wikipedia.org/wiki/12._Saeimas_deput%C4%81ti',
  xpath: '//h2[span[contains(.,"Deputātu")]]/following-sibling::table[1]//tr[td]/td[1]//a[not(@class="new")]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { lv: names })
warn EveryPolitician::Wikidata.notify_rebuilder

