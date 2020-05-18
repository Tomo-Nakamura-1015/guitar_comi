require 'rails_helper'

RSpec.describe Item, type: :model do
  it "名前があると登録できる" do
    expect(FactoryBot.create(:item)).to be_valid
  end

  it "名前がないと登録できない" do 
    expect(FactoryBot.build(:item, name: "")).to_not be_valid 
  end 

  it "画像が未登録の場合デフォルトの画像か"
end