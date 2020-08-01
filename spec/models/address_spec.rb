require 'rails_helper'

describe Address do
  describe '#create' do
    
  it "送付者のlast_nameの入力がない場合登録できないこと" do
    address = build(:address, last_name: nil)
    address.valid?
    expect(address.errors[:last_name]).to include("を入力してください")
  end

  it "送付者のfirst_nameの入力がない場合登録できないこと" do
    address = build(:address, first_name: nil)
    address.valid?
    expect(address.errors[:first_name]).to include("を入力してください")
  end

  it "送付者のlast_name_readingの入力がない場合登録できないこと" do
    address = build(:address, last_name_reading: nil)
    address.valid?
    expect(address.errors[:last_name_reading]).to include("を入力してください")
  end

  it "送付者のfirst_name_readingの入力がない場合登録できないこと" do
    address = build(:address, first_name_reading: nil)
    address.valid?
    expect(address.errors[:first_name_reading]).to include("を入力してください")
  end

  it "郵便番号の入力がない場合登録できないこと" do
    address = build(:address, postcode: nil)
    address.valid?
    expect(address.errors[:postcode]).to include("を入力してください")
  end

  it "都道府県の入力がない場合登録できないこと" do
    address = build(:address, prefecture_id: nil)
    address.valid?
    expect(address.errors[:prefecture_id]).to include("を入力してください")
  end

  it "市町村の入力がない場合登録できないこと" do
    address = build(:address, city: nil)
    address.valid?
    expect(address.errors[:city]).to include("を入力してください")
  end

  it "番地の入力がない場合登録できないこと" do
    address = build(:address, block: nil)
    address.valid?
    expect(address.errors[:block]).to include("を入力してください")
  end

  end
end