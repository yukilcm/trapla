FactoryBot.define do
  factory :travel do
    user { create(:user) }
  end
end
