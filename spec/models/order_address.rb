require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '購入情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'address_line2は空でも保存できること' do
        @order_address.address_line2 = nil
        expect(@order_address).to be_valid
      end
    end

    context '購入情報が保存できないこと' do
      # presence: true のテスト

      it 'user_idが空だと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postcodeが空だと保存できないこと' do
        @order_address.postcode = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'prefecturesが空だと保存できないこと' do
        @order_address.prefectures_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'address_cityが空だと保存できないこと' do
        @order_address.address_city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address city can't be blank")
      end
      it 'address_line1が空だと保存できないこと' do
        @order_address.address_line1 = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line1 can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      # 郵便番号のテスト

      it 'postcodeにハイフンがないと保存できないこと' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      # numericality: other_than: 1のテスト

      it 'prefectures_idが1では保存できないこと' do
        @order_address.prefectures_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefectures can't be blank")
      end

      # 電話番号のテスト

      it 'phone_numberにハイフンがあると保存できないこと' do
        @order_address.phone_number = '080-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberは半角数字ではないと保存できないこと' do
        @order_address.phone_number = '０８０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberは12桁以上だと保存できないこと' do
        @order_address.phone_number = '080123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
    end
  end
end
