require 'rails_helper'
require_relative '../support/new_customer_form'

RSpec.feature "Customers", type: :feature do
  # before do
  #   Capybara.default_driver = :selenium
  # end

  it 'Visit index page' do
    visit(customers_path)
    expect(page).to have_current_path(customers_path)
  end

    # it 'Ajax', type: :feature, js: true do
    #   visit(customers_path)
    #   click_link('Add Message')
    #   expect(page).to have_content('Yes!')
    # end

    it 'Create a customer - Page Object Pattern' do
      new_customer_form = NewCustomerForm.new

      new_customer_form.login.visit_page.fill_in_with(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        address: Faker::Address.street_address
      ).submit

      expect(page).to have_content('Customer was successfully created.')
    end

  it 'Create a customer' do
    member = create(:member)
    login_as(member, scope: :member)

    visit(new_customer_path)

    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)

    click_button('Create Customer')

    expect(page).to have_content('Customer was successfully created.')
  end

  it 'Querying' do
    member = create(:member)
    login_as(member, scope: :member)

    visit(new_customer_path)
    fill_in('Name', with: Faker::Name.name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)
    click_button('Create Customer')

    visit(customers_path)
    # print page.html

    click_link('Show this customer')

    # expect(page).to have_xpath('.//div#customer_1/p')
    expect(page).to have_selector('div#customer_1')
  end
end
