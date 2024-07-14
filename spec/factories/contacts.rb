FactoryBot.define do
  factory :contact do
    user { nil }
    name { Faker::Name.name }
    cpf { Faker::Number.unique.number(digits: 11) }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.street_address }
    complement { rand(1..300) }
    zip_code { Faker::Address.zip_code }
    latitude { 1.5 }
    longitude { 1.5 }

    association :user
  end
end
