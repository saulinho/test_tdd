FactoryBot.define do
   
  factory :customer do
    transient do
        upcased { false }
        quantity_orders { 3 }
    end

    name { Faker::Name.name }
    email { Faker::Internet.email }    
    address { Faker::Address.street_address }

    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    factory :customer_default do
      vip { false }
      days_to_pay { 15 }
    end

    trait :with_orders do
        after(:create) do |customer, evaluator|
            create_list(:order, evaluator.quantity_orders, customer: customer)
        end
    end

    after(:create) do |customer, evaluator|
        customer.name.upcase! if evaluator.upcased
    end
  end
end
