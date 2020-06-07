require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:contact) { FactoryBot.create(:contact) }

  it "問い合わせ内容が有効か" do
    expect(contact).to be_valid
  end

  it "nameが無いと無効" do
    contact.name = ""
    expect(contact).to_not be_valid
  end

  it "nameが50文字以上だと無効" do
    contact.name = "a" * 51
    expect(contact).to_not be_valid
  end

  it "emailが無いと無効" do
    contact.email = ""
    expect(contact).to_not be_valid
  end

  it 'emailに@が無いと無効' do
    contact.email = "test.com"
    expect(contact).to_not be_valid
  end

  it 'email保存時、小文字に統一されているか' do
    contact.email = "TEST@test.com"
    contact.save
    expect(contact.email).to eq 'test@test.com'
  end

  it "messageが無いと無効" do
    contact.message = ""
    expect(contact).to_not be_valid
  end

end
