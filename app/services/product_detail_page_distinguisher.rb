module ProductDetailPageDistinguisher

  def product_detail_page_distinguisher(data, data_field)
    with_prod_details_id = !data.at_css("#prodDetails").nil?
    send(data_field, data, with_prod_details_id)
  end

end
