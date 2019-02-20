require 'rails_helper'

  describe CommentsController, type: :controller do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
      @comment = FactoryBot.create(:comment)
    end

    context 'when user is logged in' do
      before do
        sign_in @user
      end

      it 'loads correct comment' do
        get :show, params: { id: @comment.id }
        expect(response).to be_ok
        expect(assigns(:order)).to eq @product
      end
    end
  end
