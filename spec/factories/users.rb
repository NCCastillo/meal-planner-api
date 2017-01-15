FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:first_name) { |n| "Jon_#{n}" }
    sequence(:last_name) { |n| "Collado_#{n}" }
    password 'top_secret'
    password_confirmation 'top_secret'
  end
end
