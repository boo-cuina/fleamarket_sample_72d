FactoryBot.define do

  factory :item do
    name              {"上着"}
    description       {"とても暖かい上着です"}
    size              {"M"}
    status            {"新品・未使用"}
    price             {"1000"}
    shipping_fee      {"送料込み"}
    shippingfrom_id      {1}
    shipping_days     {"1〜2日で発送"}
    buyer_id             {""}
    seller_id            {1}
    category_id          {17}
  end

end