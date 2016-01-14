module Spree
  class NewsController < BaseController

    def index
      @news_items = Spree::News.published.latest
    end

    def show
      @news_item = Spree::News.find(params[:id])
    end

  end
end
