class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.all(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def list_params
    params.require(:list).permit(:list_id)
  end

end
