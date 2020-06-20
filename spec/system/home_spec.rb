require 'rails_helper'

RSpec.describe "ホーム", type: :system do
  let(:user) { FactoryBot.create(:user) }
  before  { visit root_path }

end