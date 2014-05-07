
require 'spec_helper'

describe "Posts" do

  before do
    @user = FactoryGirl.create(:user)
  end
  
  describe "#create" do

    context "when the title, body and weekly_theme_id are provided" do

      before do
        @weekly_theme = FactoryGirl.create(:weekly_theme)
      end

      before do
        params = FactoryGirl.attributes_for(:post)
        params.merge! :weekly_theme_id => @weekly_theme.id
        post posts_path, { :post => params }, authentication_headers(@user)
      end

      it "creates new post associated with the current user" do
        expect(@user.posts.count).to eq 1
      end
    end
  end

  describe "#update" do

    before do
      @post = FactoryGirl.create(:post, :user => @user)
    end

    context "when a new valid value is passed" do

      before do
        patch post_path(@post), { :post => { :body => "New content"} },
              authentication_headers(@user)
      end

      it "changes the post" do
        expect(@post.reload.body).to eq "New content"
      end
    end
  end

  describe "#destroy" do

    before do
      @post = FactoryGirl.create(:post, :user => @user)
    end

    it "removes the post" do
      expect do
        delete post_path(@post), {}, authentication_headers(@user)
      end.to change { @user.posts.count }.by(-1)
    end
  end
end
