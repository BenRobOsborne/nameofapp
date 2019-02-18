require 'rails_helper'

describe Order do
  let (:product) { Product.create!(name:"mountain bike", description:"awesome bike!", image_url: "bike5.jpg") }
  let(:user) { User.create!(email: "barbara47623@gmail.com", password: "secret") }

  it "is not valid without product " do
    expect(Order.new( user: user, total: 1)).not_to be_valid
  end

  it "is a valid with user and order" do
    expect(Order.new( user: user, product: product, total: 1)).to be_valid
    end
end
