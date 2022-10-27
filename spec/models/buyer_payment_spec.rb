require 'rails_helper'

RSpec.describe BuyerPayment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_payment = FactoryBot.build(:buyer_payment, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@buyer_payment).to be_valid
      end

      it '建物名が空でも保存できる' do
        @buyer_payment.building_name = nil
        expect(@buyer_payment).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @buyer_payment.user_id = nil
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @buyer_payment.item_id = nil
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @buyer_payment.post_number = nil
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @buyer_payment.post_number = 1_234_567
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include('Post number is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県が「---」だと保存できない' do
        @buyer_payment.prefecture_id = 0
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できない' do
        @buyer_payment.prefecture_id = nil
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @buyer_payment.city = nil
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @buyer_payment.address = nil
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @buyer_payment.tell_number = nil
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include("Tell number can't be blank")
      end
      it '電話番号にハイフンがあると保存できない' do
        @buyer_payment.tell_number = '123 - 1234 - 1234'
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include('Tell number is invalid. Input only number')
      end
      it '電話番号が10桁以下であると保存できない' do
        @buyer_payment.tell_number = 12_345_678
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include('Tell number is too short (minimum is 10 characters)')
      end
      it '電話番号が12桁以上であると保存できない' do
        @buyer_payment.tell_number = 12_345_678_999_999
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include('Tell number is too long (maximum is 11 characters)')
      end
      it 'トークンが空だと保存できない' do
        @buyer_payment.token = nil
        @buyer_payment.valid?
        expect(@buyer_payment.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
