require 'rails_helper'

RSpec.describe TravelsController do
  describe "#index" do
    let(:user) { create(:user) }
    before do
      login_user user
    end
    
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end
  end
end
