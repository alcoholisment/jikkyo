FactoryBot.define do
  factory :message do
    content { 'あいうえお' }
    association :room
  end
end
