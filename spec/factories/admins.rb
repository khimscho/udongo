FactoryGirl.define do
  factory :admin do
    locale 'nl'
    first_name 'foo'
    last_name 'bar'
    sequence(:email) { |n| "foo-#{n}@bar.baz" }
    password 'sekret'
    password_confirmation 'sekret'
  end
end
