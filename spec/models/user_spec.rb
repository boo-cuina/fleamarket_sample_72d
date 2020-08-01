# ユーザー情報に関するテストコード

require 'rails_helper'
describe User do
  describe '#create' do

    it 'nicknameがない場合は登録できないこと' do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # it 'emailがない場合は登録できないこと' do
    #   user = build(:user, email: "")
    #   uesr.valid?
    #   expect(user.errors[:email]).to include("を入力してください")
    # end

    # it 'emailが既に使用されている場合は登録できないこと' do
    #   user
    # end

    # it 'passwordがない場合は登録できないこと' do
    #   user = build(:user, :password "")
    #   user.valid?
    #   expect(user.errors[:password]).to include("を入力してください")
    # end

    # it 'passwordは７文字以上でないと登録できないこと' do
    # end

    # it 'passwordはpassword_confirmationと同じでないと登録できないこと' do
    # end

    # it '名字がない場合は登録できないこと' do
    #   user = build(:user, last_name: "")
    #   user.valid?
    #   expect(user.errors[:last_name]).to include("を入力してください")
    # end

    # it '名字のよみがながない場合は登録できないこと' do
    #   user = build(:user, last_name_reading: "")
    #   user.valid?
    #   expect(user.errors[:last_name_reading]).to include("を入力してください")
    # end

    # it '名前がない場合は登録できないこと' do
    #   user = build(:user, first_name: "")
    #   user.valid?
    #   expect(user.errors[:first_name]).to include("を入力してください")
    # end

    # it '名前のよみがながない場合は登録できないこと' do
    #   user = build(:user, first_name_reading: "")
    #   user.valid?
    #   expect(user.errors[:first_name_reading]).to include("を入力してください")
    # end

    # it '生年月日がない場合は登録できないこと' do
    #   user = build(:user, birthday: "")
    #   user.valid?
    #   expect(user.errors[:birthday]).to include("を入力してください")
    # end
end