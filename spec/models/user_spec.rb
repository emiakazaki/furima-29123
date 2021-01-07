require 'rails_helper'

RSpec.describe User, type: :model do
describe 'ユーザー新規登録' do

    before do
      @user = FactoryBot.build(:user)
    end
context 'ユーザー登録ができる時' do

  end
context 'ユーザー登録ができない時' do

    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "birthdayを選択していないと登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "firstnameが空では登録できないこと" do
      @user.firstname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end

    it "lastnameが空では登録できないこと" do
      @user.lastname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "email:＠を含まない場合登録できないこと" do
      @user.email = 'akazakigmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "password:半角英数混合(半角英語のみ)" do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "password:半角数字のみでは登録できないこと" do
      @user.password = '1a1a1a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it "password:全角では登録できないこと" do
      @user.password = '２０２１０１０５'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_name_kanaが全角日本語でないと保存できないこと" do
      @user.first_name_kana = "ｽｽﾞｷ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力して下さい。")
    end

    it "last_name_kanaが全角日本語でないと保存できないこと" do
      @user.last_name_kana = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力して下さい。")
    end

    it "firstnameが全角日本語でないと保存できないこと" do
      @user.firstname = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname は全角で入力してください。")
    end

    it "lastnameが全角日本語でないと保存できないこと" do
      @user.lastname = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname は全角で入力してください。")
    end

    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
end