FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email}
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname              { Faker::Name.initials(number: 2)}
    lastname              {"山田"}
    firstname             {"太郎"}
    lastname_kana         {"ヤマダ"}
    firstname_kana        {"タロウ"}
    birthday              {"2000-01-01"}
  end
end