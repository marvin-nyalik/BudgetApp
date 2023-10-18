require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) } 
  let(:category) { create(:category, user: user) } 

  before do
    sign_in user 
  end

  describe 'GET #index' do
    it 'assigns @user and @totals' do
      get :index
      expect(assigns(:user)).to eq(user)
      expect(assigns(:totals)).to be_an(Array)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'assigns @category and @total' do
      get :show, params: { id: category.id }
      expect(assigns(:category)).to eq(category)
      expect(assigns(:total)).to be_an(Numeric)
    end

    it 'renders the show template' do
      get :show, params: { id: category.id }
      expect(response).to render_template('show')
    end
  end

  describe 'POST #create' do
      it 're-renders the new template on failure' do
      category_params = { name: '' } 
      post :create, params: { category: category_params }
      expect(response).to render_template('new')
    end
  end
end
