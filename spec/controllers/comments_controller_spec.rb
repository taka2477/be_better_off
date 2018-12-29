require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user) { create(:user) }
  let(:user_post) { create(:post) }
  let(:comment) { create(:comment, user_id: user.id, post_id: user_post.id) }

  before do
    sign_in user
  end

  describe "#create" do
    it "can add a comment" do
      @comment_params = attributes_for(:comment, user_id: user.id)
      expect {
        post :create, params: { comment: @comment_params, post_id: user_post.id }
      }.to change(user.comments, :count).by(1)
    end
  end

  # describe "#destroy" do
  #   it "can destroy a comment" do
  #     expect {
  #       delete :destroy, params: { id: comment.id }
  #     }.to change(user.comments, :count).by(-1)
  #   end
  # end
end
