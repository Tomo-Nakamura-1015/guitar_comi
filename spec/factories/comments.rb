FactoryBot.define do
  factory :comment do
    title   { "test" }
    rate    { "3" }
    content { "MyString" }

    association :user
    association :item
  end
end
