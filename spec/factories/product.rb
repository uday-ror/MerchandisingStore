FactoryBot.define do
  factory :product do
    code { "MUG" }
    name { "smug" }
    price { 6 }
  end

  factory :product1 do
    code { "TSHIRT" }
    name { "polo" }
    price { 15 }
  end

  factory :product2 do
    code { "HODDIE" }
    name { "hm" }
    price { 20 }
  end
end