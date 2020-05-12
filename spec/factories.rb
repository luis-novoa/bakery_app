FactoryBot.define do
  factory :user do
    name { 'model' }
    password { '123456' }
    email { 'model@test.com' }
    admin { 'user' }
  end
end