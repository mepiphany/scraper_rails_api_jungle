require 'open-uri'
require 'nokogiri'
class Scraper
  attr_reader :asin, :doc
  include ProductInformationAttr
  include CategoryBaseInformationAttr
  include CategorySubInformationAttr

  def initialize(asin)
    @asin = asin
    @doc = Nokogiri::HTML(open("https://www.amazon.com/dp/#{asin}"))
  end

  def create_record
    data_entry = product_info_data_entry(doc, asin)

    if product_does_not_exist(asin)
      product_information = ProductInformation.new(data_entry)
      create_base_category(product_information.id) if product_information.save
    else
      product_information = ProductInformation.find_by(asin: asin)
      product_information.update_attributes(data_entry)
    end

  end

  def create_base_category(product_info_id)
    data_entry = base_category_data_entry(doc, product_info_id)

    if category_does_not_exist(product_info_id, 'base')
      Category.create(data_entry)
    else
      category = Category.find_by(product_information_id: product_info_id, category_type: 'base')
      category.update_attriutes(data_entry)
    end
  end

  def product_does_not_exist(asin)
    ProductInformation.find_by(asin: asin).nil?
  end

  def category_does_not_exist(product_info_id, category_type)
    Category.find_by(product_information_id: product_info_id, category_type: category_type).nil?
  end


  # title = doc.at_css('#title').text.strip
  # produc_img = doc.at_css("#imgTagWrapperId").children[1].attributes['src'].value
  # customer_review = doc.at_css("#acrCustomerReviewText").children.text.split.first




      ############ with product information div id="prodDetails" #################

      # base_category = doc.at_css('#SalesRank td.value').children[0].text.strip.split(' ')[2]
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
