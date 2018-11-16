#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

by_cat = (10 .. 13).map { |term| WikiData::Category.new("Kategorija:#{term}. Saeimas deputāti", 'lv').member_titles }.inject(:|)

lv_names_13 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://lv.wikipedia.org/wiki/Veidne:13._Saeima',
  xpath: '//li//a[not(@class="new")]/@title',
  after: '//th[contains(.,"Deputāti")]',
  before: '//th[contains(.,"Saistītie raksti")]',
)

lv_names_12 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://lv.wikipedia.org/wiki/Veidne:12._Saeima',
  xpath: '//li//a[not(@class="new")]/@title',
  after: '//th[contains(.,"Deputāti")]',
  before: '//th[contains(.,"Saistītie raksti")]',
)

lv_names_11 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://lv.wikipedia.org/wiki/Veidne:11._Saeima',
  xpath: '//li//a[not(@class="new")]/@title',
  after: '//th[contains(.,"Deputāti")]',
  before: '//th[contains(.,"Saistītie raksti")]',
)

lv_names_10 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://lv.wikipedia.org/wiki/Veidne:10._Saeima',
  xpath: '//li//a[not(@class="new")]/@title',
  after: '//th[contains(.,"Deputāti")]',
  before: '//th[contains(.,"Saistītie raksti")]',
)

pl_names_10 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://pl.wikipedia.org/wiki/Pos%C5%82owie_na_Sejm_Republiki_%C5%81otewskiej_X_kadencji',
  xpath: '//li//a[not(@class="new")]/@title',
  before: '//span[@id="Przypisy"]',
)

pl_names_11 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://pl.wikipedia.org/wiki/Pos%C5%82owie_na_Sejm_Republiki_%C5%81otewskiej_XI_kadencji',
  xpath: '//li//a[not(@class="new")]/@title',
  after: '//span[@id="Lista_pos.C5.82.C3.B3w_XI_kadencji"]',
  before: '//span[@id="Przypisy"]',
)

pl_names_12 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://pl.wikipedia.org/wiki/Pos%C5%82owie_na_Sejm_Republiki_%C5%81otewskiej_XII_kadencji',
  xpath: '//li//a[not(@class="new")]/@title',
  after: '//span[@id="Lista_pos.C5.82.C3.B3w_XII_kadencji"]',
  before: '//span[@id="Przypisy"]',
)

# Find all P39s of the 12th Seima
query = <<EOS
  SELECT DISTINCT ?item
  WHERE
  {
    BIND(wd:Q21191589 AS ?membership)
    BIND(wd:Q20557340 AS ?term)

    ?item p:P39 ?position_statement .
    ?position_statement ps:P39 ?membership .
    ?position_statement pq:P2937 ?term .
  }
EOS
p39s = EveryPolitician::Wikidata.sparql(query)

EveryPolitician::Wikidata.scrape_wikidata(ids: p39s, names: {
  lv: by_cat | lv_names_13 | lv_names_12 | lv_names_11 | lv_names_10,
  pl: pl_names_12 | pl_names_11 | pl_names_10,
})
