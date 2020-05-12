FactoryBot.define do
  factory :user do
    name { 'test' }
    password { 123456 }
    email { 'test@test.com' }
    admin { false }
  end
end