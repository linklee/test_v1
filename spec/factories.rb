FactoryGirl.define do
  factory :edit do
    body "MyText"
    user
    answer 
  end
  factory :answer do
    body "MyText"
    user
    question 
  end
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:last_name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{rand(10...999999999999)}@gmail.com"}
    password "password123"
    password_confirmation "password123"

  end

  factory :question do
    title "title"
    body "Lorem ipsum"
    user
  end
end