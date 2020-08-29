require 'rails_helper'
describe PurchaseAddress do
  before do
    @purchaseaddress = FactoryBot.build(:purchase_address)
  end

  describe '住所の登録' do
    context '住所の登録がうまくいくとき' do
      it 'クレカ情報、郵便番号、都道府県、市区町村、番地、電話番号があれば登録できる' do
        expect(@purchaseaddress).to be_valid
      end
      it '建物名が空でも登録できる' do
        @purchaseaddress.building = nil
        expect(@purchaseaddress).to be_valid
      end
    end

    context '住所の登録がうまくいかないとき' do
      it '郵便番号が空だと登録できない' do
        @purchaseaddress.post_cord = nil
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Post cord can't be blank")
      end
      it '郵便番号にハイフンが含まれた正しい形式でないと登録できない' do
        @purchaseaddress.post_cord = '1234567'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Post cord ハイフンを使用してください")
      end
      it '都道府県が空だと登録できな' do
        @purchaseaddress.prefecture_id = nil
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと登録できない' do
        @purchaseaddress.city  = nil
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @purchaseaddress.block = nil
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @purchaseaddress.phone_number = nil
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが含まれた形式では登録できない' do
        @purchaseaddress.phone_number = '090-1234-5678'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Phone number この番号は登録できません")
      end
    end
  end
end
