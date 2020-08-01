FactoryBot.define do
  
  factory :user do
    nickname                {"taro"}
    email                   {"taro@gmail.com"}
    password                {"0000000"}
    password_confirmation   {"0000000"}
    last_name               {"山田"}
    last_name_reading       {"ヤマダ"}
    first_name              {"太郎"}
    first_name_reading      {"タロウ"}
    birthday                {"2020-04-01"}
  end
  
end