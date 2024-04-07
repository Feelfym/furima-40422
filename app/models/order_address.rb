class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code,
                :prefecture_id,
                :city,
                :house_number,
                :building_name,
                :phone_number,
                :user_id,
                :item_id,
                :token

  with_options presence: true do
    validates :postal_code, presence: { message: '郵便番号を入力してください' },
                            format: { with: /\A\d{3}[-]\d{4}\z/, message: '郵便番号はハイフンを含めた半角数字で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: '都道府県を選択してください' }
    validates :city, presence: { message: '市区町村を入力してください' }
    validates :house_number, presence: { message: '番地を入力してください' }
    validates :phone_number, presence: { message: '電話番号を入力してください' },
                             format: { with: /\A\d{10,11}\z/, message: '電話番号は半角数字で入力してください' }
    validates :token, presence: { message: 'カード情報が入力されていません' }
    validates :user_id, presence: { message: 'ユーザー情報が不正です。' }
    validates :item_id, presence: { message: '商品IDが不正です。' }
  end

  def save
    order = Order.create(
      user_id: user_id,
      item_id: item_id
    )
    ShipToAddress.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
