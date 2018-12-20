require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    before { get :index }

    it "responds successfully" do
      expect(response).to be_successful
    end
  end
end
