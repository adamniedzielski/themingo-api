require 'spec_helper'

describe ThemeGroup do
  
  before do
    @group = FactoryGirl.build(:theme_group)
  end

  specify "fields" do
    expect(@group).to respond_to(:name)
    expect(@group).to respond_to(:description)
  end

  it "has many weekly themes" do
    expect(@group).to respond_to(:weekly_themes)
  end

  it "has many users" do
    expect(@group).to respond_to(:users)
  end

  it "has many memberships" do
    expect(@group).to respond_to(:memberships)
  end

  describe "name" do

    it "is required" do
      @group.name = nil
      expect(@group.errors_on(:name)).to be_present
    end
  end
end
