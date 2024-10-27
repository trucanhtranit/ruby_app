namespace :crawl_data do
  desc "TODO"
  task run_category: :environment do
    require 'open-uri'
    require 'nokogiri'

    doc = Nokogiri::HTML(URI.open('https://nettruyenaa.com/tim-truyen'))

    doc.css('#ctl00_divRight .ModuleContent ul.nav li').each do |item|
      category = Category.find_or_create_by(name: item.text.strip, url: item.at_css('a')['href'])
      puts 'Create category: ' + category.name
    end
  end

  task run_comic: :environment do
    require 'open-uri'
    require 'nokogiri'

    Category.where.not(name: 'Tất cả').limit(6).each do |category|
      puts 'Start crawl data for category: ' + category.name
      doc = Nokogiri::HTML(URI.open(category.url))
      doc.css('.ModuleContent .row .item').each do |item|
        Comic.find_or_create_by(title: item.css('a.jtip').text, url: item.at_css('a.jtip')['href'], category: category)
      end
    end
  end

  task run_chapter: :environment do
    require 'open-uri'
    require 'nokogiri'

    Comic.all.order(id: :desc).limit(100).each do |comic|
      puts 'Start crawl data for comic: ' + comic.title + ' - ' + comic.id.to_s
      doc = Nokogiri::HTML(URI.open(comic.url))
      doc.css('.list-chapter .row .col-xs-5.chapter').each do |item|
        chapter = Chapter.find_or_create_by(title: item.css('a').text, url: item.at_css('a')['href'], comic: comic)
        puts 'Create chapter: ' + chapter.title
        # puts item.css('a').text
        # puts item.at_css('a')['href']
      end
    end
  end

  task run_page: :environment do
    Chapter.all.each do |chapter|
      puts 'Start crawl data for chapter: ' + chapter.title + ' - ' + chapter.comic.title + ' - ' + chapter.url
      doc = Nokogiri::HTML(URI.open(chapter.url))
      doc.css('.reading-detail .page-chapter').each do |item|
        Page.find_or_create_by(url: item.at_css('img')['data-src'], chapter: chapter)
      end
    end
  end
end
