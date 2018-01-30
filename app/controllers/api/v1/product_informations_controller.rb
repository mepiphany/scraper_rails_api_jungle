class Api::V1::ProductInformationsController < ApplicationController

  def index
    render json: product_information.order("created_at DESC")
  end

  def create
    response = Scraper.new(params[:asin]).create_record
    if !response.nil?
      product_id = response
      product_info = product_information.find(product_id)

      render status: 200,  json: { success: "Matching Product Found",
                                   asin: params[:asin],
                                   product_id: product_id,
                                   product_name: product_info.product_name,
                                   product_dimensions: product_info.product_dimensions,
                                   rank: product_info.rank,
                                   ladder: product_info.ladder}.to_json
    else
      render status: 404,  json: { error: "Product Not Found" }.to_json
    end
  end

  def show
    product_information = product_information.find(params[:id])
    render json: product_information
  end

  private

  def product_information

    product_information = ProductInformation.joins(:categories).select('product_informations.id,
                                                                        product_informations.product_img,
                                                                        product_informations.product_name,
                                                                        product_informations.num_customer_reviews,
                                                                        product_informations.product_dimensions,
                                                                        product_informations.asin,
                                                                        product_informations.created_at,
                                                                        categories.rank,
                                                                        categories.category_type,
                                                                        categories.ladder,
                                                                        categories.product_information_id ')

  end

end
