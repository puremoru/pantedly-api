FactoryBot.define do
  factory :message do
    sender_id { 1 }
    reciever_id { 1 }
    content { "MyText" }
  end
end
