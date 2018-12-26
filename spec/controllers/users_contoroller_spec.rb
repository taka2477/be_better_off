require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) }

  describe "GET #show" do
    context "as an authenticated user" do
      before do
        sign_in user
        get :show, params: { id: user.id }
      end

      it "responds successfully" do
        expect(response).to be_successful
      end

      it "returns a 200 response" do
        expect(response.status).to eq(200)
      end

      it "responds correct template" do
        expect(response).to render_template :show
      end

      it "checks instance variable of user" do
        expect(assigns(:user)).to eq user
      end
    end

    context "as a guest" do
      before do
        get :index
      end

      it "does not respond successfuly" do
        expect(response).not_to be_successful
      end

      it "returns a 302 response" do
        expect(response.status).to eq(302)
      end

      it "return to the sign_in page" do
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end
end
