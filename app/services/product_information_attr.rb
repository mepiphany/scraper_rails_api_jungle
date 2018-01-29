module ProductInformationAttr
  include ProductDetailPageDistinguisher

  def product_info_data_entry(data, asin)
    {
      product_img: data.at_css("#imgTagWrapperId").children[1].attributes['src'].value,
      product_name: data.at_css('#title').text.strip,
      num_customer_reviews: data.at_css("#acrCustomerReviewText").children.text.split.first,
      product_dimensions: product_detail_page_distinguisher(data, 'product_dimensions'),
      asin: asin
    }
  end

  def product_dimensions(data, with_prod_details_id)
    if with_prod_details_id
      data.at('div#prodDetails table tr:contains("Product Dimensions")').text.gsub(/Product Dimensions/, "").strip
    else
      dimension = data.at('div#detail-bullets td.bucket div.content li:contains("Product Dimensions:")')
      dimension = dimension.children[1].text.strip if dimension
    end
  end

end
