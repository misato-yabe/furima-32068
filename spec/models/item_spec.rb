require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品の登録がうまくいくとき' do
      it '必要な情報を適切に入力すると、商品の出品ができること' do
        expect(@item).to be_valid
      end
    end

    describe '商品の登録がうまくいかないとき' do
      it '商品画像が1枚も登録されていないとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空であるとき' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が空であるとき' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'カテゴリーの情報が選択されていないとき' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre Select')
      end

      it '商品の状態についての情報が選択されていないとき' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it '配送料の負担についての情報が選択されていないとき' do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage Select')
      end

      it '配送元の地域についての情報が選択されていないとき' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end

      it '配送までの日数についての情報が選択されていないとき' do
        @item.schedule_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Schedule Select')
      end

      it '価格についての情報が空であるとき' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が¥300より低い場合' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end

      it '価格が¥9,999,999より高い場合' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end

      it '販売価格は半角数字のみ保存可能なこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
