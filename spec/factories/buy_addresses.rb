FactoryBot.define do
  factory :buy_address do
    postal_code    {"000-0000"}
    municipalities {"大阪市"}
    number         {"3丁目12番1号"}
    tel            {"00000000000"}
    area_id        {2}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
