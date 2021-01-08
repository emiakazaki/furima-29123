FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    first_name_kana       {'ヤマダ'}
    last_name_kana        {'タロウ'}
    firstname             {'山田'}
    lastname              {'太郎'}
    birthday              {'1990-01-05'}
  end
 end