require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context 'ユーザー登録がうまくいくとき' do
      it "ニックネーム、メールアドレス、パスワード、ユーザー名（漢）、ユーザー名（カナ）、生年月日があれば登録できる" do
        expect(@user).to be_valid
      end
      it "パスワードは6文字以上で登録できる" do
        @user.nickname = "aaaaaa"
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録がうまくいかないとき' do
      it "ニックネームが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email このメールアドレスは使用できません。")
      end
      it "メースアドレスが一意性がないと登録できない" do
        @user.save
        other_user = FactoryBot.build(:user)
        other_user.email = @user.email
        other_user.valid?
        expect(other_user.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスに＠を含まないと登録できない" do
        @user.email = "@"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email このメールアドレスは使用できません。")
      end
      it "パスワードが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードは6文字以上でないと登録できない" do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは半角英数字でないと登録できない" do
        @user.password = "１２３４５６"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input full-width characters.")
      end
      it "パスワードが存在しても確認用パスワードが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー名（姓）が空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザー名（名）が空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザー名（姓）は『漢字、ひらがな、カタカナ』でないと登録できない" do
        @user.first_name = "ABCD"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width katakana characters.")
      end
      it "ユーザー名（名）は『漢字、ひらがな、カタカナ』でないと登録できない" do
        @user.last_name = "ABCD"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width katakana characters.")
      end
      it "ユーザー名（姓カナ）が空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "ユーザー名（名カナ）が空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "ユーザー名（姓カナ）は『カタカナ』でないと登録できない" do
        @user.first_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid Input half-width characters.")
      end
      it "ユーザー名（名カナ）は『カタカナ』でないと登録できない" do
        @user.last_name_kana = "金太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid Input half-width characters.")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end