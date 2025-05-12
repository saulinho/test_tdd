FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Order #{n}" }
    customer
  end
end
