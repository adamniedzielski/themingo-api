require 'spec_helper'

describe WeeklyTheme do
  
  before do
    @weekly_theme = FactoryGirl.build(:weekly_theme)
  end

  specify :fields do
    expect(@weekly_theme).to respond_to(:name)
    expect(@weekly_theme).to respond_to(:description)
  end

  it "belongs to theme group" do
    expect(@weekly_theme).to respond_to(:theme_group)
  end

  it "has many posts" do
    expect(@weekly_theme).to respond_to(:posts)
  end

  describe "name" do

    it "is required" do
      @weekly_theme.name = nil
      expect(@weekly_theme.errors_on(:name)).to be_present
    end
  end

  describe "theme group" do

    it "is required" do
      @weekly_theme.theme_group = nil
      expect(@weekly_theme.errors_on(:theme_group)).to be_present
    end
  end

end
