require 'rails_helper'

describe Address do
  describe '#create' do
    
  it "送付者のlast_nameの入力がない場合登録できないこと" do
    address = build(:address, last_name: nil)
    address.valid?
    expect(address.errors[:last_name]).to include("can't be blank")
  end

  it "送付者のfirst_nameの入力がない場合登録できないこと" do
    address = build(:address, first_name: nil)
    address.valid?
    expect(address.errors[:first_name]).to include("can't be blank")
  end

  it "送付者のlast_name_readingの入力がない場合登録できないこと" do
    address = build(:address, last_name_reading: nil)
    address.valid?
    expect(address.errors[:last_name_reading]).to include("can't be blank")
  end

  it "送付者のfirst_name_readingの入力がない場合登録できないこと" do
    address = build(:address, first_name_reading: nil)
    address.valid?
    expect(address.errors[:first_name_reading]).to include("can't be blank")
  end

  it "郵便番号の入力がない場合登録できないこと" do
    address = build(:address, postcode: nil)
    address.valid?
    expect(address.errors[:postcode]).to include("can't be blank")
  end

  it "都道府県の入力がない場合登録できないこと" do
    address = build(:address, prefecture_id: nil)
    address.valid?
    expect(address.errors[:prefecture_id]).to include("can't be blank")
  end

  it "市町村の入力がない場合登録できないこと" do
    address = build(:address, city: nil)
    address.valid?
    expect(address.errors[:city]).to include("can't be blank")
  end

  it "番地の入力がない場合登録できないこと" do
    address = build(:address, block: nil)
    address.valid?
    expect(address.errors[:block]).to include("can't be blank")
  end

  end
end