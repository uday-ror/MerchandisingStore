# frozen_string_literal: true

require 'rails_helper'

describe ProductsController, type: :controller do
  let(:product) { FactoryBot.create(:product) }
  let(:product1) { FactoryBot.create(:product) }
  let(:product2) { FactoryBot.create(:product) }

  # before do
  #   sign_in(user)
  # end

  # index action
  describe 'GET products#index' do
    it 'Get# displays products of user' do
      # sign_in(user)
      get :index
      expect(response.status).to eq(200)
    end
  end

  # show action
  describe 'GET# products#show' do
    before do
      get :show, params: { id: product.id }
    end

    it 'show the products details' do
      expect(response.status).to eq(200)
    end
  end

  # update action
  describe 'PATCH #update' do
    it 'updates the product' do
      patch :update, params: { id: product.id, price: '20' }
      expect(response.status).to eq(200)
    end

    it 'does not change the product, and re-renders the form' do
      patch :update, params: { id: product.id, price: nil }
      expect(Product.count).to eq(1)
    end

    it 're-renders the "product" view' do
      respond_to do |format|
        format.json { render json: @product }
        expect(response.status).to eq(200)
      end
    end
  end

  # total_price action
  describe 'GET #total_price' do
    let(:product) { FactoryBot.create(:product) }
    let(:product1) { FactoryBot.create(:product) }
    let(:product2) { FactoryBot.create(:product) }
    item = %w[MUG TSHIRT HODDIE]
    before do
      get :index
      get :total_price, params: { items: item }
    end

    it 'is expected to check item count' do
      # byebug
      expect(total_price).to eq(41)
    end

    # it 'is expected to  item  price #discount 30%' do
    #   expect(response.status).to eq(302)
    # end

    # it 'is expected to have MUG quantity 2 then 1 MUG get free' do
    # get :total_price , params: {item: ('MUG''MUG''TSHIRT''HODDIE')}
    #   expect(assigns(:item).quantity).to eq(2)
    # end
  end
end
