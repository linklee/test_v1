FactoryGirl.define do
  factory :edit do
    body "MyText"
    user nil
    answer nil
  end
  factory :answer do
    body "MyText"
    user nil
    question nil
  end
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:last_name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@gmail.com"}
    password "password123"
    password_confirmation "password123"

  end

  factory :question do
    title "title"
    body "Lorem ipsum"
    user
  end
end