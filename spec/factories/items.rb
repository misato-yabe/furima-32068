FactoryBot.define do
  factory :item do
    # image {'fixtures/test.png'}
    title { 'aaa' }
    text { 'aaaaa' }
    price { 300 }
    genre_id { 2 }
    condition_id { 2 }
    postage_id { 2 }
    prefecture_id { 2 }
    schedule_id { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test.jpg'), filename: 'test.jpg', content_type: 'image/jpg')
    end
  end
end
