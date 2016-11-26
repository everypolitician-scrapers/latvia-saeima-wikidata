#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

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

EveryPolitician::Wikidata.scrape_wikidata(names: {
  lv: lv_names_12 | lv_names_11 | lv_names_10,
  pl: pl_names_12 | pl_names_11 | pl_names_10,
})
