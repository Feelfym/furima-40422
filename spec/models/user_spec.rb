require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる時' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'a1a1a'
        @user.password_confirmation = 'a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password パスワードには英字と数字の両方を含めてください')
      end

      it 'passwordが半角数字のみだと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password パスワードには英字と数字の両方を含めてください')
      end

      it 'passwordが全角だと登録できない' do
        @user.password = 'ａａａ１１１'
        @user.password_confirmation = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password パスワードには英字と数字の両方を含めてください')
      end

      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = 'a1a1a1'
        @user.password_confirmation = 'a1a1a2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角でないと登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが全角でないと登録できない' do
        @user.last_name = 'ｷﾑﾗ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい')
      end

      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaが全角カタカナでないと登録できない' do
        @user.first_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カタカナで入力して下さい')
      end

      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaが全角カタカナでないと登録できない' do
        @user.last_name_kana = 'ｷﾑﾗ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナで入力して下さい')
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
