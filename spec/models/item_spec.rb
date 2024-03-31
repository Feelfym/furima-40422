require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品の登録ができる時' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の登録ができない時' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image 画像をアップロードしてください')
      end

      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Name 商品名を入力してください')
      end

      it 'infoが空だと登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Info 商品の説明を入力してください')
      end

      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category カテゴリーを選択してください')
      end

      it 'sales_status_idが1だと登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status 商品の状態を選択してください')
      end

      it 'shipping_fee_idが1だと登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee 配送料の負担方法を選択してください')
      end

      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture 発送元の地域を選択してください')
      end

      it 'days_to_ship_idが1だと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship 発送までの日数を選択してください')
      end

      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格を入力してください')
      end

      it 'priceが300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 299より大きい必要があります')
      end

      it 'priceが1000000000以上だと登録できない' do
        @item.price = 1_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 1000000000より小さい必要があります')
      end

      it 'priceが半角数字でないと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は数値で入力してください')
      end

      it 'priceが半角英数混合では登録できない' do
        @item.price = '300yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は数値で入力してください')
      end

      it 'priceが半角英語では登録できない' do
        @item.price = 'threehundred'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 価格は数値で入力してください')
      end

      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User 商品の登録にはユーザーが必要です')
      end
    end
  end
end
