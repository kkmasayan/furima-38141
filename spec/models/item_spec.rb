require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品'
   context '出品できる場合'
    it '全ての項目が存在すれば登録できる' do
      expect(@item).to be_valid
    end

    context '出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'status_condition_idが「---」だと出品できない' do
       @item.status_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status condition can't be blank")
     end
     it 'prefecture_idが「---」だと出品できない' do
      @item.prefecture_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include("Prefecture can't be blank")
     end
     it 'shipping_charges_idが「---」だと出品できない' do
      @item.shipping_charges_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
    end
    it 'shipping_days_idが「---」だと出品できない' do
      @item.shipping_days_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping days can't be blank")
    end
    it 'shipping_priceが空だと出品できない' do
      @item.shipping_price = " "
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping price can't be blank")
    end
    it 'shipping_priceが300円以下だと出品できない' do
      @item.shipping_price = 200
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping price  is out of setting range")
    end
    it 'shipping_priceが9999999円以上だと出品できない' do
      @item.shipping_price = 100000000
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping price  is out of setting range")
    end
    it 'category_idが「---」だと出品できない' do
      @item.category_id = 0
       @item.valid?
       expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    end
  end
