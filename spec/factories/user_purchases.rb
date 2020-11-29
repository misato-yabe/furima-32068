FactoryBot.define do
  factory :user_purchase do
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '板橋区' }
    block { '2-5' }
    tell { '09012345678' }
    building { '太郎' }
  end
end
