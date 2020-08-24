require 'rails_helper'
describe Product do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('public/images/test_image.jpeg')
  end

  describe '商品の新規登録' do
    context '商品の新規登録がうまくいくとき' do
      it '画像、商品名、商品説明、カテゴリー、商品の状態、配送料の負担、発送元の情報、発送までの日数、価格、ユーザー情報があれば登録できる' do
        expect(@product).to be_valid
      end
      it '価格の幅が300円〜9,999,999円までであれば登録できる' do
        @product.price = '10000'
        expect(@product).to be_valid
      end
    end

    context '商品の登録がうまくできないとき' do
      it '画像が空だと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空だと登録できない' do
        @product.discription = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Discription can't be blank")
      end
      it 'カテゴリーが空だと登録できない' do
        @product.category = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空だと登録できない' do
        @product.status = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料金の負担が空だと登録できない' do
        @product.delivery_chaege = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery chaege can't be blank")
      end
      it '発送元の情報が空だと登録できない' do
        @product.shipping_area = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送までの日数が空だと登録できない' do
        @product.shipping_day = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '価格が空だと登録できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満であれば登録できない' do
        @product.price = "290"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price この金額は入力できません")
      end
      it '価格が10,000,000円以上の場合登録できない' do
        @product.price = "10000005"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price この金額は入力できません")
      end

    end
  end
end
