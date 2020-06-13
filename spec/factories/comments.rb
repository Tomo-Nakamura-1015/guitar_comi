FactoryBot.define do
  factory :comment do
    title   { "test_title" }
    rate    { "3" }
    content { "MyString" }

    association :user
    association :item
  end
end
