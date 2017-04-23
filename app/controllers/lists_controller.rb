class ListsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.create(list_params)
    if @list.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  helper_method :current_list
  def current_list
    @current_list ||= List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
