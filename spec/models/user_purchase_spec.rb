require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '商品購入情報の保存' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_purchase).to be_valid
    end
    it 'postcodeが空だと保存できないこと' do
      @user_purchase.postcode = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_purchase.postcode = '1234567'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postcode Input correctly")
    end
    it 'postal_codeが全角だと保存できないこと' do
      @user_purchase.postcode = '１２３-４５６７'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postcode Input correctly")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @user_purchase.prefecture_id = 1
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Prefecture Select")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @user_purchase.prefecture_id = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Prefecture Select")
    end
    it 'cityが空だと保存できないこと' do
      @user_purchase.city = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと保存できないこと' do
      @user_purchase.block = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Block can't be blank")
    end
    it 'buildingは空でも保存できること' do
      @user_purchase.building = nil
      expect(@user_purchase).to be_valid
    end
    it 'tellが空だと保存できないこと' do
      @user_purchase.tell = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Tell can't be blank")
    end
    it 'tellが全角数字だと保存できないこと' do
      @user_purchase.tell = '０９０１２３４５６７８'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Tell Phone number Input only number")
    end
    it 'tellにハイフンがあると保存できないこと' do
      @user_purchase.tell = '090-1234-5678'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Tell Phone number Input only number")
    end
  end
end