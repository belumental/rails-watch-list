class BookmarksController < ApplicationController
before_action :set_list, only: [:new, :create]


def new
  @bookmark = Bookmark.new
end

def create
  @bookmark = Bookmark.new(bookmark_params)
  @bookmark.list = @list
  if @bookmark.save
    redirect_to list_path(@list), notice: "Movie List was successfully created."
  else
    render :new, status: :unprocessable_entity
  end
end

def destroy
  @bookmark = Bookmark.find(params[:id])
  @bookmark.destroy
  redirect_to list_path(@bookmark.list)
end

private

def set_list
  @list = List.find(params[:list_id])
end

# def set_bookmark
#   @bookmark = Bookmark.find(params[:bookmark_id])
# end

def bookmark_params
  params.require(:bookmark).permit(:movie_id, :comment)
end

end
