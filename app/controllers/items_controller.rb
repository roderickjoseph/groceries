class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = current_list.items.create(item_params)
    redirect_to list_path(params[:list_id])
  end

  private

  def current_list
    if params[:list_id]
      @current_list ||= List.find(params[:list_id])
    else
      current_item.list
    end
  end

  def current_item
    @current_item ||= Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :row_order_position)
  end
end
