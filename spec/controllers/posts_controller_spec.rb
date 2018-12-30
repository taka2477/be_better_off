require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:user_post) { create(:post, user: user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    before { get :index }

    it "responds successfully" do
      expect(response).to be_successful
    end

    it "returns a 200 response" do
      expect(response.status).to eq(200)
    end

    it "responds correct template" do
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    let(:post_params) { attributes_for(:post) }

    it "can make a post" do
      expect {
        post :create, params: { post: post_params }
      }.to change(Post, :count).by(1)
    end
  end

  describe "DELETE #destroy" do
    it "deletes a post" do
      expect {
        delete :destroy, params: { id: user_post.id }
      }.to change(Post, :count).by(-1)
    end
  end
end
