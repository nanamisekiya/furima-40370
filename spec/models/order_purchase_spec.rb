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
      it '郵便番号が空だと登録できない' do
        @order_purchase.post_code = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Post code can't be blank")
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
    end
  end

end
