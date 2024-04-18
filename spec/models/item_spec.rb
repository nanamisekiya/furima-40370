require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '必要な情報がそろっていれば商品が出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品名が未入力だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '画像が添付されていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品説明が未入力だと登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it '商品カテゴリーが1だと登録できない' do
        @item.product_category_id	= '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category can't be blank")
      end
      it '商品状態が1だと登録できない' do
        @item.product_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end
      it '配送料が1だと登録できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it '配送地域が1だと登録できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '配送日数が1だと登録できない' do
        @item.delivery_time_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it '価格が空欄だと登録できない' do
        @item.product_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product price can't be blank")
      end
      it '価格が半角以外だと登録できない_ひらがな' do
        @item.product_price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price is not a number')
      end
      it '価格が半角以外だと登録できない_カタカナ' do
        @item.product_price = 'イイイイ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price is not a number')
      end
      it '価格が半角以外だと登録できない_ローマ字' do
        @item.product_price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price is not a number')
      end
      it '価格が¥299円以下だと登録できない' do
        @item.product_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price must be greater than or equal to 300')
      end
      it '価格が¥10,000,000円以上だと登録できない' do
        @item.product_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Product price must be less than or equal to 9999999')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
