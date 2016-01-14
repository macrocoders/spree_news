class Spree::Admin::NewsController < Spree::Admin::ResourceController

  def index
    @news_items = Spree::News.all
  end

  def show
    @news_item = Spree::News.find(params[:id])
  end

  def new
    @news_item = Spree::News.new
  end

  def create
    @news_item = Spree::News.new(news_params)
    if @news_item.save
      flash[:notice] = "News item saved successfully"
      redirect_to admin_news_index_path
    else
      flash[:alert] = "There was an error saving your news item"
      redirect_to :back
    end
  end

  def edit
    @news_item = Spree::News.find(params[:id])
  end

  def update
    @news_item = Spree::News.find(params[:id])
    if @news_item.update_attributes(news_params)
      flash[:notice] = "News item saved successfully"
      redirect_to admin_news_index_path
    else
      flash[:alert] = "There was an error saving your news item"
      redirect_to :back
    end
  end

  def destroy
    @news_item = Spree::News.find(params[:id])
    @news_item.destroy
    render nothing: true
    #if @news_item.destroy
    #  flash[:notice] = "News item removed successfully"
    #  redirect_to admin_news_index_path
    #else
    #  flash[:alert] = "There was an error removing the news item"
    #  redirect_to :back
    #end
  end

  private

  def news_params
    params.require(:news).permit(:title, :description, :published)
  end

end
