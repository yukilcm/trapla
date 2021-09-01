FactoryBot.define do
  factory :schedule do
    travel { create(:travel) }
    start_at { Time.current }
    end_at { Time.current + 1.hour }
    title { 'title' }
  end
end
