require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "content,user_id,item_idがあると投稿できる" do
    comment = FactoryBot.create(:comment)
    expect(comment.save).to be_truthy
  end

  it "contentがないと投稿できない" do
    comment = FactoryBot.create(:comment)
    comment.content = ""
    expect(comment.save).to_not be_truthy
  end

  context "すでにデータがある場合" do
    let(:comment) { FactoryBot.create(:comment) }

    it "commentと紐づくuserが作成できているか" do
      expect(comment.user).to be_valid
    end

    it "commentに紐づくitemが作成されているか" do
      expect(comment.item).to be_valid
    end

    it "投稿の削除ができる" do
      expect(comment.destroy).to be_truthy
    end
  end
end