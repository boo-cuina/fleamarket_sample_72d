require 'rails_helper'

describe Item do
  describe '#create' do

    it "sizeが無い場合は登録できないこと" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("can't be blank")
    end


  end
end
