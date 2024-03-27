class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :user
  has_one_attached :image
end
