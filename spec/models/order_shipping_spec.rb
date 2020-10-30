require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  describe '商品購入' do
    before do
      @order_shipping = FactoryBot.build(:order_shipping)
    end

    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく存在すれば購入できる' do
        expect(@order_shipping).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @order_shipping.building = nil
        expect(@order_shipping).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だと購入できない' do
        @order_shipping.postal_code = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないと購入できない' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code Include hyphen(-)")
      end

      it 'prefecture_idが1だと購入できない' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture Select")
      end

      it 'cityが空だと購入できない' do
        @order_shipping.city = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと購入できない' do
        @order_shipping.address = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @order_shipping.phone_number = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11文字より多いと購入できない' do
        @order_shipping.phone_number = '090123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'phone_numberが半角数字以外だと購入できない' do
        @order_shipping.phone_number = '０９０１２３４５６７８'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number Input only number")
      end

      it 'tokenが空だと購入できない' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
