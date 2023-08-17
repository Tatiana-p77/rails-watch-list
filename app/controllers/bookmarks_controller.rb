class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  before_action :set_bookmark, only: [:destroy]

  def new
    @bookmark = @list.bookmarks.new
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark was successfully destroyed.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end


# class BookmarksController < ApplicationController
#   def new
#     @list = List.find(params[:list_id])
#     @bookmark = Bookmark.new
#   end

#   def create
#     @bookmark = Bookmark.new(bookmark_params)
#     @list = List.find(params[:list_id])
#     @bookmark.list = @list
#     @bookmark.save!

#     redirect_to list_path(@list)
#   end

#   def destroy
#     @bookmark = Bookmark.find(params[:id])
#     @bookmark.destroy

#     redirect_to list_path(@bookmark.list)
#   end

#   private

#   def bookmark_params
#     params.require(:bookmark).permit(:movie_id)
#   end
# end
