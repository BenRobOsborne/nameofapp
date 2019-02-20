require 'rails_helper'

describe ProductsController, type: :controller do
    before do
        @user = FactoryBot.create(:user)
        @product = FactoryBot.create(:product)
    end

    describe 'GET #edit' do
        context 'when user is logged in' do
            before do
                sign_in @user
            end

            it "can edit product" do
                get :edit, params: {id: @user}
                expect(response).to be_ok
                expect(assigns(:product)).to eq @product
            end

        end

    end

end
