require 'spec_helper'

describe Post do
  
  before do
    @post = FactoryGirl.build(:post)
  end

  specify "fields" do
    expect(@post).to respond_to(:title)
    expect(@post).to respond_to(:body)
    expect(@post).to respond_to(:link)
  end

  it "belongs to user" do
    expect(@post).to respond_to(:user)
  end

  it "belongs to weekly theme" do
    expect(@post).to respond_to(:weekly_theme)
  end

  it "belongs to theme group" do
    expect(@post).to respond_to(:theme_group)
  end

  describe "title" do

    it "is required" do
      @post.title = nil
      expect(@post.errors_on(:title)).to be_present
    end
  end

  describe "body" do

    it "is required" do
      @post.body = nil
      expect(@post.errors_on(:body)).to be_present
    end
  end  

  describe "weekly theme" do

    it "is required" do
      @post.weekly_theme = nil
      expect(@post.errors_on(:weekly_theme)).to be_present
    end
  end

  describe "user" do

    it "is required" do
      @post.user = nil
      expect(@post.errors_on(:user)).to be_present
    end
  end
end
