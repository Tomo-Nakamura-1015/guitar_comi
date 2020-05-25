require 'rails_helper'

RSpec.describe Item, type: :model do
  it "名前があると登録できる" do
    expect(FactoryBot.create(:item)).to be_valid
  end

  it "名前がないと登録できない" do 
    expect(FactoryBot.build(:item, name: "")).to_not be_valid 
  end 

  context "すでに登録データがある場合" do
    before { @item = FactoryBot.create(:item) }
    it "編集ができる" do
      @item.name = "test_test"
      expect(@item.save).to be_truthy
    end

    it "削除ができる" do
      expect(@item.destroy).to be_truthy
    end

    it "itemが削除されるとcommentも削除される" do
      comment = FactoryBot.create(:comment, item: @item)
      expect{ @item.destroy }.to change{ Comment.count }.by(-1)
    end
  end

  
end