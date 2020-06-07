require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { FactoryBot.create(:item) }

  describe "新規登録の場合" do
    it "名前があると登録できる" do
      expect(item).to be_valid
    end

    it "名前がないと登録できない" do 
      item.name = ""
      expect(item).to_not be_valid 
    end
  end

  describe "すでに登録データがある場合" do
    it "編集ができる" do
      item.name = "test_test"
      expect(item).to be_valid
    end

    it "削除ができる" do
      expect(item.destroy).to be_valid
    end

  end
end