require 'rails_helper'

describe Comment do
    context "when a comment gets created" do
    	let(:product){ Product.create!(name: "tester bike")}
        let(:user) { FactoryBot.create(:user) }

        it "is not valid without a user" do
          expect(Comment.new(user_id: nil, product_id: product.id, body: "Nice bike")).to_not be_valid
        end

        it " is not valid without a body" do
          expect(Comment.new(user_id: user.id, product_id: product.id, body: nil )).to_not be_valid
        end

        it " is not valid without a product" do
          expect(Comment.new(user_id: user.id, product_id: nil, body: "nice bike" )).to_not be_valid
        end

        it " is not valid without a rating" do
          expect(Comment.new(user_id: user.id, product_id: product.id, body: "nice bike", rating: nil )).to_not be_valid
        end

        it " is not valid when rating is not an integer" do
          expect(Comment.new(user_id: user.id, product_id: product.id, body: "nice bike", rating: "good" )).to_not be_valid
        end

        it " is valid when user, body, product and rating present" do
          expect(Comment.new(user_id: user.id, product_id: product.id, body: "nice bike", rating: 4 )).to be_valid
        end

    end
end
