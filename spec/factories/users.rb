FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'johndoe@example.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
