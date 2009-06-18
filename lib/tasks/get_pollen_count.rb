require 'rubygems'
require 'hpricot'
require 'mechanize'
require 'uri'
WWW::Mechanize.html_parser = Hpricot
agent = WWW::Mechanize.new
agent.keep_alive = false # true causes TypeError
page = agent.get('http://www.aaaai.org/nab/collectors/index.cfm')
page = page.form_with(:action => 'index.cfm?p=start') do |f|
  f['LIusername'] = 'pdaftary'
  f['LIpassword'] = 'ffw242'
end.click_button
page = page.parser { |f| Hpricot f, :xhtml_strict => true }
page = (page/'table[3]/tr/td').first
page = (page/'table/tr')
page = page[4..page.size].each do |val|
  day = (val/'td').first.inner_html
  grass = (val/'td')[1].inner_html
  trees = (val/'td')[2].inner_html
  weeds = (val/'td')[3].inner_html
  fungi = (val/'td')[4].inner_html
  PollenCount.create(:date => Date.parse(day), :grass => grass, :trees => trees, :weeds => weeds, :fungi => fungi)
end