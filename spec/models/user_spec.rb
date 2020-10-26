require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいくとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birth_dateが正しく存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが数値のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'abcd1'
        @user.password_confirmation = 'abcd1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが一致しない場合登録できない' do
        @user.password = 'abcdef1'
        @user.password_confirmation = 'abcdef2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが英字だと登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name には全角文字を使用してください')
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが英字だと登録できない' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name には全角文字を使用してください')
      end

      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaがひらがなだと登録できない' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana には全角カタカナを使用してください')
      end

      it 'last_name_kanaが漢字だと登録できない' do
        @user.last_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana には全角カタカナを使用してください')
      end

      it 'last_name_kanaが英字だと登録できない' do
        @user.last_name_kana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana には全角カタカナを使用してください')
      end

      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaがひらがなだと登録できない' do
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana には全角カタカナを使用してください')
      end

      it 'first_name_kanaが漢字だと登録できない' do
        @user.last_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana には全角カタカナを使用してください')
      end

      it 'first_name_kanaが英字だと登録できない' do
        @user.last_name_kana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana には全角カタカナを使用してください')
      end

      it 'birth_dateが空だと登録できない' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
