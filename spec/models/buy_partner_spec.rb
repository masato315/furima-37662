require 'rails_helper'

RSpec.describe BuyPartner, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_partner = FactoryBot.build(:buy_partner, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_partner).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buy_partner.building_name = ''
        expect(@buy_partner).to be_valid
      end
      it 'priceとtokenがあれば保存できること' do
        expect(@buy_partner).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できない' do
        @buy_partner.post_code = nil
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが空だと保存できない' do
        @buy_partner.prefecture_id = 1
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと保存できない' do
        @buy_partner.municipalities = nil
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できない' do
        @buy_partner.address = nil
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @buy_partner.phone_number = nil
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'post_codeはハイフンが無いと保存できない' do
        @buy_partner.post_code = '1234567'
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeは半角文字列でないと保存できない' do
        @buy_partner.post_code = '１２３-４５６７'
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include('Post code is invalid')
      end
      it 'phone_numberは10桁以上11桁以内でないと保存できない' do
        @buy_partner.phone_number = '1111'
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numbernumberは半角数値でないと保存できない' do
        @buy_partner.phone_number = '１２３４５６７８９０１'
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @buy_partner.token = nil
        @buy_partner.valid?
        binding.pry
        expect(@buy_partner.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
