class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create(item_params)
  end

  private

  def item_params
    params.require(:item)
          .permit(
            :name,
            :info,
            :category_id,
            :sales_status_id,
            :shipping_fee_id,
            :prefecture_id,
            :days_to_ship_id,
            :price,
            :user_id,
            :image
          )
  end
end
