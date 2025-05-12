require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has a order and a customer' do
    order = create(:order)
    puts order.description
    puts order.customer.name
    expect(order.description).to match("Order")
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'has a 3 orders' do
    create_list(:order, 3)
    expect(Order.count).to eq(3)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders)    
    puts customer.inspect
    puts customer.orders.inspect
    expect(customer.orders.count).to eq(3)
  end
end
