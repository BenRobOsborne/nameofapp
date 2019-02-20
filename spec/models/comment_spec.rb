require 'rails_helper'

describe Comment do
    context "when a comment gets created" do
    	let(:product){ Product.create!(name: "tester bike")}
        let(:user) { FactoryBot.create(:user) }

        it "is not valid without a user" do
          expect(Comment.new(user_id: nil, product_id: product.id, body: "Nice bike")).to_not be_valid
        end

    end
end
