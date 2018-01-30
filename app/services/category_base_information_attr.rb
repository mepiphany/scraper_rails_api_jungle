module CategoryBaseInformationAttr
  include ProductDetailPageDistinguisher

  def base_category_data_entry(doc, product_info_id)
    {
      rank: product_detail_page_distinguisher(doc, 'rank'),
      category_type: "base",
      ladder: product_detail_page_distinguisher(doc, 'ladder'),
      product_information_id: product_info_id
    }
  end

  def rank(data, with_prod_details_id)
    if with_prod_details_id
      begin
        data.at_css('tr#SalesRank td.value').children[0].text.strip.split(' ')[0].gsub(/#/, "")
      rescue
        data.at('div#prodDetails tr:contains("Best Sellers Rank") span span').text.split(' ')[0].gsub(/#/, "")
      end
    else
      data.at_css('#SalesRank').children[2].text.strip.split.first.gsub(/#/, "")
    end

  end

  def ladder(data, with_prod_details_id)
    if with_prod_details_id
      begin
        data.at_css('#SalesRank td.value').children[0].text.strip.split(' ')[2..-1].join(' ').gsub(/\(.*\)|[()]/, "").strip
      rescue
        data.at('div#prodDetails tr:contains("Best Sellers Rank") span span').text.split[3..-1].join(' ').gsub(/\(.*\)/, "").strip
      end
    else
      data.at_css('#SalesRank').children[2].text.strip.split[2..-1].join(' ').gsub(/\(/, " ").strip
    end
  end

end
