require 'spec_helper'

describe User do
  
  before do
    @user = FactoryGirl.build(:user)
  end

  specify "fields" do
    expect(@user).to respond_to(:email)
    expect(@user).to respond_to(:password)
    expect(@user).to respond_to(:nickname)
    expect(@user).to respond_to(:first_name)
    expect(@user).to respond_to(:last_name)
    expect(@user).to respond_to(:description)
    expect(@user).to respond_to(:age)
    expect(@user).to respond_to(:location)
  end

  describe "nickname" do

    it "is required" do
      @user.nickname
      expect(@user.errors_on(:nickname)).to be_present
    end
  end

  it "has many theme groups" do
    expect(@user).to respond_to(:theme_groups)
  end

  it "has many posts" do
    expect(@user).to respond_to(:posts)
  end
end
