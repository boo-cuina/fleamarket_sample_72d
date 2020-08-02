# ユーザー情報に関するテストコード

require 'rails_helper'
describe User do
  describe '#create' do

    it "nickname, email, password, paasword_confirmation, last_name, last_name_reading, first_name, first_name_reading, birthdayが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid      
    end

    it 'nicknameがない場合は登録できないこと' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it 'emailがない場合は登録できないこと' do
      user = build(:user, email: nil)
      uesr.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it 'emailが既に使用されている場合は登録できないこと' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に存在します")
    end

    it 'passwordがない場合は登録できないこと' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it 'passwordは７文字以上であれば登録できること' do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordは６文字以下であると登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は７文字以上で入力してください")
    end

    it 'passwordはpassword_confirmationと同じでないと登録できないこと' do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードが一致しません")
    end

    it '名字がない場合は登録できないこと' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it '名字のよみがながない場合は登録できないこと' do
      user = build(:user, last_name_reading: nil)
      user.valid?
      expect(user.errors[:last_name_reading]).to include("を入力してください")
    end

    it '名前がない場合は登録できないこと' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it '名前のよみがながない場合は登録できないこと' do
      user = build(:user, first_name_reading: nil)
      user.valid?
      expect(user.errors[:first_name_reading]).to include("を入力してください")
    end

    it '生年月日がない場合は登録できないこと' do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
  end
end