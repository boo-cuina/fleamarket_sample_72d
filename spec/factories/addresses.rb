FactoryBot.define do
  
  factory :address do
    last_name           {"山田"}
    last_name_reading   {"ヤマダ"}
    first_name          {"太郎"}
    first_name_reading  {"タロウ"}
    postcode            {"000-0000"}
    prefecture_id       {"1"}
    city                {"渋谷区"}
    block               {"道玄坂"}

  end
end
