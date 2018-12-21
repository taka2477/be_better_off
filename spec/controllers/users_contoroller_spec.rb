require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = create(:user)
    get :show, params: { id: @user.id }
  end

  describe "GET #show" do
    it "responds successfully" do
      expect(response).to be_successful
    end

    it "returns a 200 response" do
      expect(response.status).to eq(200)
    end

    it "responds correct template" do
      expect(response).to render_template :show
    end

    context "instance variable check" do
      it "assigns correct @user" do
        expect(assigns(:user)).to eq @user
      end
    end
  end
end
