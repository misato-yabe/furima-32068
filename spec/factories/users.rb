FactoryBot.define do
  factory :user do
    nickname { 'やまだ' }
    email { 'aaa@aaa' }
    password { '00000a' }
    password_confirmation { '00000a' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
