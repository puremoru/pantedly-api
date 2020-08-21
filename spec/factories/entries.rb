FactoryBot.define do
  factory :entry do
    user_id { 1 }
    requirement_id { 1 }
    reason { "MyText" }
  end
end
