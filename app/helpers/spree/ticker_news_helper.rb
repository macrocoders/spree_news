module Spree
  module TickerNewsHelper
    def insert_ticker_news(params={})
      params[:class] ||= 'news-ticker'
      params[:ticker_id] ||= 'news-container'
      params[:background_color] ||= '#e02f67'
      params[:text_color] ||= '#fff'
      params[:font_size] ||= '14px'
      container_default_styles = "border: 1px solid #{params[:background_color]};
                                  background-color: #{params[:background_color]}"
      li_default_styles = "color: #{params[:text_color]};
                           font-size: #{params[:font_size]};"
      news_items = Spree::News.published
      return '' if news_items.empty?
      content_tag :div, class: params[:class] do
        content_tag :div, id: 'news-container', style: container_default_styles  do
          content_tag :ul do
            news_items.map do |news_item|
              content_tag :li, style: li_default_styles do
                news_item.description
              end
            end.join.html_safe
          end
        end
      end
    end
  end
end
