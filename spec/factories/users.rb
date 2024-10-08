FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(domain: 'gmail.com') }
    password_digest { Faker::Internet.password(max_length: 8, mix_case: false, special_characters: false) }
  end
end
