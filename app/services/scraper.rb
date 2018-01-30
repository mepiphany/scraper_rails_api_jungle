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

      return product_information.id
    else
      product_information = ProductInformation.find_by(asin: asin)
      product_information.update_attributes(data_entry)

      return product_information.id
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


end
