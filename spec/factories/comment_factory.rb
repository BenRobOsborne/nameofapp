FactoryBot.define do

  factory :comment do
    association :user, factory: :user
    association :product, factory: :product
    body { "This is a very nice bike"}
    rating { "4"}
  end
end
