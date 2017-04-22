class ListsController < ApplicationController
  def index
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

end
