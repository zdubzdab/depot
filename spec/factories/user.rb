FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    phone    "530099"
    password "foobarrr"
    password_confirmation "foobarrr"
  end
end