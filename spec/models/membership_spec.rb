
require 'spec_helper'

describe Membership do
  
  before do
    @membership = FactoryGirl.build(:membership)
  end

  it "belongs to user" do
    expect(@membership).to respond_to(:user)
  end

  it "belongs to theme group" do
    expect(@membership).to respond_to(:theme_group)
  end

  describe "user" do

    it "is required" do
      @membership.user = nil
      expect(@membership.errors_on(:user)).to be_present
    end
  end

  describe "theme group" do

    it "is required" do
      @membership.theme_group = nil
      expect(@membership.errors_on(:theme_group)).to be_present
    end
  end  
end
