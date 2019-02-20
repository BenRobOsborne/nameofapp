require 'rails_helper'

  describe OrdersController, type: :controller do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
      @order = FactoryBot.create(:order)
    end

    describe 'GET #show' do
      context 'when user is logged in' do
        before do
          sign_in @user
        end

        it 'loads correct order details' do
          get :show, params: { id: @user.id }
          expect(response).to be_ok
          expect(assigns(:order)).to eq @order
        end
      end
    end
  end
