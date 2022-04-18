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
        expect(@buy_partner.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'prefecture_idが空だと保存できない' do
        @buy_partner.prefecture_id = 1
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
      it 'municipalitiesが空だと保存できない' do
        @buy_partner.municipalities = nil
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空だと保存できない' do
        @buy_partner.address = nil
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できない' do
        @buy_partner.phone_number = nil
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'post_codeはハイフンが無いと保存できない' do
        @buy_partner.post_code = '1234567'
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'post_codeは半角文字列でないと保存できない' do
        @buy_partner.post_code = '１２３-４５６７'
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '電話番号が9桁以下だと登録できないこと' do
        @buy_partner.phone_number = '1111'
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が12桁以上だと登録できないこと' do
        @buy_partner.phone_number = '1111111111111'
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numberは半角数値でないと保存できない' do
        @buy_partner.phone_number = '１２３４５６７８９０１'
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'tokenが空では登録できないこと' do
        @buy_partner.token = nil
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'userが紐付いていなければ購入できない' do
        @buy_partner.user_id = nil
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていなければ購入できない' do
        @buy_partner.item_id = nil
        @buy_partner.valid?
        expect(@buy_partner.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
