FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "john.doe.#{n}@example.com" }
    password 'internet'
  end
end
