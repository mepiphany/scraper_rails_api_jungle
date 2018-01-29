class Api::V1::ProductsController < ApplicationController

  def index
    Scraper.new("B002QYW8LW").create_record
    render json: ProductInformation.all
  end

end


# B002QYW8LW tooth
# B01HNQ3G5E adidas without dimension
# B078PBR5C6
