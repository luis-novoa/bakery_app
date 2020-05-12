FactoryBot.define do
  factory :user do
    trait :model do
      name { 'model' }
      password { '123456' }
      email { 'model@test.com' }
      admin { 'user' }
    end

    trait :dummy do
      name { 'dummy' }
      password { 'testest' }
      email { 'test@test.com' }
      admin { 'user' }
    end

    factory :model_user, traits: [:model]
    factory :test_user, traits: [:dummy]
  end
end