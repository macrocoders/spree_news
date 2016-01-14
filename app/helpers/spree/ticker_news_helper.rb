module Spree
  module TickerNewsHelper
    def insert_ticker_news(params={})
      params[:class] ||= 'news-ticker'
      params[:ticker_id] ||= 'news-container'
      news_items = Spree::News.published
      return '' if news_items.empty?
      content_tag :div, class: params[:class] do
        content_tag :div, id: 'news-container' do
          content_tag :ul do
            news_items.map do |news_item|
              content_tag :li do
                news_item.description
              end
            end.join.html_safe
          end
        end
      end
    end
  end
end
