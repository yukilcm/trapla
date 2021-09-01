require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe '#within_travel_period?' do
    let(:travel) { create(:travel, start_date: Date.current, end_date: Date.current + 1.day) }
    
    context 'when within travel period' do
      let(:schedule) { create(:schedule, travel: travel) }
      it 'return true' do
        expect(schedule.within_travel_period?).to eq true
      end
    end
    
    context 'when before travel period' do
      let(:schedule) { create(:schedule, travel: travel, start_at: Time.current - 2.day, end_at: Time.current - 2.day + 1.hour) }
      it 'return true' do
        expect(schedule.within_travel_period?).to eq false
      end
    end
    
    context 'when after travel period' do
      let(:schedule) { create(:schedule, travel: travel, start_at: Time.current + 2.day, end_at: Time.current + 2.day + 1.hour) }
      it 'return true' do
        expect(schedule.within_travel_period?).to eq false
      end
    end
    
     
    context 'when end_at is not within travel period' do
      let(:schedule) { create(:schedule, travel: travel, start_at: Time.current + 1. hour, end_at: Time.current + 2.day + 10. hour) }
      it 'return true' do
        expect(schedule.within_travel_period?).to eq false
      end
    end
  end
end
