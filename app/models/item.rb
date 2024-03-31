class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :sales_status_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 1_000_000_000 }
  end
end
