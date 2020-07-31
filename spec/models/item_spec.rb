require 'rails_helper'

describe Item do
  describe '#create' do

    it "nameが無い場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "descriptionが無い場合は登録できないこと" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "sizeが無い場合は登録できないこと" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("can't be blank")
    end

    it "statusが無い場合は登録できないこと" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    it "priceが無い場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "shipping_feeが無い場合は登録できないこと" do
      item = build(:item, shipping_fee: nil)
      item.valid?
      expect(item.errors[:shipping_fee]).to include("can't be blank")
    end

    it "shippingfromが無い場合は登録できないこと" do
      item = build(:item, shippingfrom: nil)
      item.valid?
      expect(item.errors[:shippingfrom]).to include("can't be blank")
    end

    it "shipping_daysが無い場合は登録できないこと" do
      item = build(:item, shipping_days: nil)
      item.valid?
      expect(item.errors[:shipping_days]).to include("can't be blank")
    end

    it "seller_idが無い場合は登録できないこと" do
      item = build(:item, seller: nil)
      item.valid?
      expect(item.errors[:seller]).to include("can't be blank")
    end

    it "category_idが無い場合は登録できないこと" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("can't be blank")
    end

  end
end
