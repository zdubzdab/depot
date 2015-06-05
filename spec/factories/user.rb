FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    phone    "530099"
    password "password"
    password_confirmation "password"
  end
end