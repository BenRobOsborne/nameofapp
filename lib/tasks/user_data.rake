namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(first_name: "Ben",
                 email: "benosborne605@gmail.com",
                 password: "yxcvbn",
                 password_confirmation: "yxcvbn")
    admin.toggle!(:admin)
  end
end
