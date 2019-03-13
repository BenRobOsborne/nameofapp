require 'rails_helper'

  describe Product do
    context "when the product has comments" do
      let(:product) { Product.create!(name: "race bike") }
      let(:user) { FactoryBot.create(:user) }

      before do
        product.comments.create!(rating: 1, user: user, body: "Awful bike!")
        product.comments.create!(rating: 3, user: user, body: "Ok bike!")
        product.comments.create!(rating: 5, user: user, body: "Great bike!")
      end

      it "returns the average rating of all comments" do
        expect(product.average_rating_comment).to eq 3
      end
   end

   describe '#validations' do
     it "is not valid without a name" do
       expect(Product.new(description: "Nice ")).to_not be_valid
     end

     it 'when all params are correct' do
       expect(Product.new(name: "race bike", description: "Nice ")).to be_valid
     end
   end
end
