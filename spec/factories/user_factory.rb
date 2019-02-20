FactoryBot.define do

    factory :user do
      sequence(:email) { |n| "user#{n}@example.com" }
      password {"secret"}
      first_name {"John"}
      last_name {"Smith"}
    end

    factory :admin, class: User do
      email {"admin@gmail.com"}
      password {"secret"}
      admin {true}
      first_name {"Admin"}
      last_name {"User"}
    end
end
