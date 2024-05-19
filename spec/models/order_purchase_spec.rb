require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_purchase = FactoryBot.build(:order_purchase, user_id: user.id, item_id: item.id)
  end

  describe '商品の購入' do
    context '商品が購入できる場合' do
      it '購入情報が全て入力されている' do
        expect(@order_purchase).to be_valid
      end
      it '購入情報が建物名以外入力されている' do
        @order_purchase.building = ''
        expect(@order_purchase).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'tokenが空だと購入できない' do
        @order_purchase.token = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと登録できない' do
        @order_purchase.post_code = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にーがないと登録できない' do
        @order_purchase.post_code = '1234567'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が1だと登録できない' do
        @order_purchase.shipping_area_id = '1'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '市区町村が空だと登録できない' do
        @order_purchase.city = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @order_purchase.block = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @order_purchase.phone_number = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が９桁の場合登録できない' do
        @order_purchase.phone_number = '123456789'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上の場合登録できない' do
        @order_purchase.phone_number = '123456789012'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が全角の場合登録できない' do
        @order_purchase.phone_number = '１２３４５６７８９０１'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid')
      end
      it 'ユーザーが紐づいていない場合購入できない' do
        @order_purchase.user_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("User can't be blank")
      end
      it '商品情報が紐づいていない場合購入できない' do
        @order_purchase.item_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
