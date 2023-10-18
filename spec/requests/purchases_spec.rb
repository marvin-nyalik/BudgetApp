require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns @purchase, @category, and @user' do
      get :new, params: { category_id: category.id }
      expect(assigns(:purchase)).to be_a_new(Purchase)
      expect(assigns(:category)).to eq(category)
      expect(assigns(:user)).to eq(user)
    end

    it 'renders the new template' do
      get :new, params: { category_id: category.id }
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it 'creates a new purchase' do
      purchase_params = { amount: 100, name: 'New Purchase' }
      post :create, params: { category_id: category.id, purchase: purchase_params }
      expect(Purchase.last.name).to eq('New Purchase')
    end

    it 'redirects to the category page on success' do
      purchase_params = { amount: 100, name: 'New Purchase' }
      post :create, params: { category_id: category.id, purchase: purchase_params }
      expect(response).to redirect_to(category_path(category))
    end
  end
end
