require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.create(:comment) }

  describe "新規投稿する場合" do

    it "口コミを新規投稿できる" do
      expect(comment).to be_valid
    end

    it "titleがないと投稿できない" do
      comment.title = ""
      expect(comment).to_not be_valid
    end

    it "contentがないと投稿できない" do
      comment.content = ""
      expect(comment).to_not be_valid
    end

    it "rateが無いと投稿できない" do
      comment.rate = ""
      expect(comment).to_not be_valid
    end

    it "titleが50文字以内なら投稿できる" do
      comment.title = "a" * 50
      expect(comment).to be_valid
    end

    it "titleが50文字以上だと投稿できない" do
      comment.title = "a" * 51
      expect(comment).to_not be_valid
    end

    it "contentが300文字以内なら投稿できる" do
      comment.content = "a" * 300
      expect(comment).to be_valid
    end

    it "contentが300文字以上だと投稿できない" do
      comment.content = "a" * 301
      expect(comment).to_not be_valid
    end

    it "rateが無いと投稿できない" do
      comment.rate = ""
      expect(comment).to_not be_valid
    end
  end

  describe "すでにデータがある場合" do

    it "commentと紐づくuserがあるか" do
      expect(comment.user).to be_valid
    end

    it "commentに紐づくitemがあるか" do
      expect(comment.item).to be_valid
    end

    it "投稿の削除ができる" do
      expect(comment.destroy).to be_truthy
    end
  end
end