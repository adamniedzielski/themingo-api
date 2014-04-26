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
      @user.nickname = nil
      expect(@user.errors_on(:nickname)).to be_present
    end
  end

  it "has many theme groups" do
    expect(@user).to respond_to(:theme_groups)
  end

  it "has many posts" do
    expect(@user).to respond_to(:posts)
  end

  it "has many memberships" do
    expect(@user).to respond_to(:memberships)
  end

  describe "#friend?" do

    before do
      @another_user = FactoryGirl.build(:user)
    end

    context "when the two users have at least one common group" do

      before do
        group = FactoryGirl.build(:theme_group)
        @user.theme_groups << group
        @another_user.theme_groups << group
      end

      it "returns true" do
        expect(@user.friend?(@another_user)).to eq true
      end
    end

    context "when the two users have no common group" do

      it "returns false" do
        expect(@user.friend?(@another_user)).to eq false
      end
    end
  end
end
