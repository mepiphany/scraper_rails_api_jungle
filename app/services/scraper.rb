require 'open-uri'
require 'nokogiri'
class Scraper
  attr_reader :asin


  def initialize(asin)
    @asin = asin
  end

  def scrape
    doc = Nokogiri::HTML(open("https://www.amazon.com/dp/B002QYW8LW"))
    binding.pry

  end


  # title = doc.at_css('#title').text.strip
  # produc_img = doc.at_css("#imgTagWrapperId").children[1].attributes['src'].value
  # customer_review = doc.at_css("#acrCustomerReviewText").children.text.split.first




      ############ with product information div id="prodDetails" #################

      # base_category = doc.at_css('tr#SalesRank td.value').children[0].text.strip.split(' ')[2]
      # base_rank = doc.at_css('tr#SalesRank td.value').children[0].text.strip.split(' ')[0].gsub(/#/, "")
      # sub_category = doc.at_css('tr#SalesRank td.value ul.zg_hrsr li.zg_hrsr_item span.zg_hrsr_ladder').text
      # sub_rank = doc.at_css('tr#SalesRank td.value ul.zg_hrsr li.zg_hrsr_item span.zg_hrsr_rank').text.gsub(/#/, "")
      # dimension = doc.at('div.section.techD tr.size-weight td:contains("Product Dimensions")').next_element.text

      ############# with other type ########################

      # div id=detail-bullets
          # td class=bucket
              # div class=content
                  # li contains production dimensions titles are bold
                  # li contains asin
      # getting the product rank
          # id=SalesRank

      # base_category
      # base_rank
      # sub_category
      # sub_rank
      # dimension







end
