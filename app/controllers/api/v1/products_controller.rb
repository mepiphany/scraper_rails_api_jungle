class Api::V1::ProductsController < ApplicationController

  def index
    Scraper.new("B002QYW8LW").scrape
    render json: "hello"
  end

end
