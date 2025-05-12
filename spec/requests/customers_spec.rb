require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'responds successfully' do
    get :index
    expect(response).to be_successful
  end

  it 'responds 302 response' do
    customer = create(:customer)
    get :show, params: { id: customer.id }
    expect(response).to have_http_status(302)
  end
  
  it '#show' do
    member = create(:member)
    customer = create(:customer)

    sign_in member    

    get :show, params: { id: customer.id }
    expect(response).to have_http_status(200)
  end

  it 'render a :show template' do
    member = create(:member)
    customer = create(:customer)

    sign_in member    
    
    get :show, params: { id: customer.id }
    expect(response).to render_template(:show)
  end
end
