class BookmarksController < ApplicationController
    def new
      # we need @restaurant in our `simple_form_for`
      @list = List.find(params[:list_id])
      @bookmark = Bookmark.new
    end

    def create
      @bookmark = Bookmark.new(bookmark_params)
      # we need `restaurant_id` to associate review with corresponding restaurant
      @list = List.find(params[:list_id])
      @bookmark.list = @list
      @bookmark.save
      redirect_to list_path(@list)
    end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
