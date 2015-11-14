#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'rest-client'

def noko_for(url)
  Nokogiri::HTML(open(url).read) 
end

def wikinames(url)
  noko = noko_for(url)
  noko.xpath('//h2[span[contains(.,"Deputātu")]]/following-sibling::table[1]//tr[td]/td[1]//a[not(@class="new")]/@title').map(&:text)
end

names = wikinames('https://lv.wikipedia.org/wiki/12._Saeimas_deput%C4%81ti')

WikiData.ids_from_pages('lv', names).each_with_index do |p, i|
  data = WikiData::Fetcher.new(id: p.last).data('lv') rescue nil
  unless data
    warn "No data for #{p}"
    next
  end
  ScraperWiki.save_sqlite([:id], data)
end
warn RestClient.post ENV['MORPH_REBUILDER_URL'], {} if ENV['MORPH_REBUILDER_URL']

