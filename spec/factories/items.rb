FactoryBot.define do
  factory :item do
    name             {"aaaaa"}
    explanation      {"aaaaaaa"}
    category_id      {2}
    quality_id       {3}
    shipping_id      {2}
    price            {1000}
    shipping_day_id  {2}
    area_id          {2}
    association :user
    
    after(:build) do |message|
      message.image.attach(io: File.open('app/assets/images/furima-intro02.png'), filename: 'furima-intro02.png')
    end
  end
end
