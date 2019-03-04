require 'rails_helper'

describe ProductsController, type: :controller do
    before do
        @user = FactoryBot.create(:user)
        @admin = FactoryBot.create(:admin )
        @product = FactoryBot.create(:product)
    end

    describe 'GET #index' do
      it "renders the products index template" do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end
    end

    describe "GET #show" do
      it 'renders the product show template' do
        get :show, params: {id: @product.id}
        expect(response).to be_ok
        expect(assigns(:product)).to eq @product
      end
    end

    describe "GET #new" do
      context ' when user is logged in and does not have admin role' do
        before do
            sign_in @user
        end
        it 'redirects to root_path' do
          get :new
          expect(response).to have_http_status(302)
          expect(response).to redirect_to(root_path)
        end
      end

      context 'when admin is signed in' do
        before do
            sign_in @admin
        end
        it 'renders the new product form template' do
          get :new
          expect(response).to be_ok
        end
      end
    end

    describe 'GET #edit' do
        context 'when user is admin' do
            before do
                sign_in @admin
            end

            it "can edit product" do
                get :edit, params: {id: @product.id}
                expect(response).to be_ok
                expect(assigns(:product)).to eq @product
            end
        end
        context 'when user is not admin' do
          before do
            sign_in @user
          end

          it 'redirects to root_path' do
            get :edit, params: {id: @product.id}
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(root_path)
          end
          
        end
     end

        describe 'DELETE #destroy' do
          context 'when user is logged in and has admin role' do
            before do
              sign_in @admin
            end

            it 'can delete product from database' do
              delete :destroy, params: { id: @product.id }
              expect(response).to redirect_to products_url
            end
          end
          context 'when user is not admin' do
              before do
                sign_in @user
              end

            it 'can not destroy product' do
              delete :destroy, params: { id: @product.id }
              expect(response).to redirect_to products_url
            end
          end

        end




end
