require 'rails_helper'

RSpec.describe Customer, type: :model do
  # Validation tests
  it "is valid with valid attributes" do
    customer = create(:customer)    
    expect(customer.full_name).to eq("Sr. #{customer.name}")
  end

  # Herança
  it "is valid with vip attributes" do
    customer = create(:customer_vip)    
    expect(customer.vip).to be true
    expect(customer.days_to_pay).to eq(30)
  end

  #Atributo transitório
  it "is valid with upcased name" do
    customer = create(:customer_default, upcased: true)    
    expect(customer.name.upcase).to eq(customer.name) 
  end
end
