
require 'spec_helper'

describe "Theme groups" do

  before do
    @user = FactoryGirl.create(:user)
    @group = FactoryGirl.create(:theme_group)
  end
  
  describe "#index" do

    before do
      get theme_groups_path, {}, authentication_headers(@user)
    end

    it "lists all existing groups" do
      expect(json['theme_groups']).to be_present
      expect(json['theme_groups']).to be_an Array
      expect(json['theme_groups'].size).to eq 1
      expect(json['theme_groups'].first['name']).to eq @group.name
    end

    it "includes only basic data about each theme_group" do
      expect(json['theme_groups'].first['weekly_themes']).not_to be_present
    end
  end

  describe "#show" do

    context "when user is *not* a member of this group" do

      before do
        get theme_group_path(@group), {}, authentication_headers(@user)
      end

      it "responds with unauthorized" do
        expect(response.status).to eq 401
      end
    end

    context "when user is a member of this group" do

      before do
        @user.join(@group)
        @user.save!

        get theme_group_path(@group), {}, authentication_headers(@user)
      end

      it "responds with success" do
        expect(response.status).to eq 200
      end

      it "returns group details" do
        expect(json['theme_group']).to be_present
        expect(json['theme_group']['name']).to eq @group.name
      end

      it "returns all weekly themes of this group" do
        expect(json['theme_group']['weekly_themes']).to be_an Array
      end

      context "when group has one weekly theme" do

        before do
          @weekly_theme = FactoryGirl.create(:weekly_theme, :theme_group => @group)
        end

        context "and this weekly theme has one post" do

          before do
            @post = FactoryGirl.create  :post,
                                        :weekly_theme => @weekly_theme,
                                        :user => @user
            
            get theme_group_path(@group), {}, authentication_headers(@user)
          end

          it "returns this weekly theme" do
            result = json['theme_group']['weekly_themes'].first['name']
            expect(result).to eq @weekly_theme.name
          end

          it "returns this post inside this weekly_theme" do
            weekly_theme = json['theme_group']['weekly_themes'].first
            expect(weekly_theme['posts']).to be_present
            expect(weekly_theme['posts'].first['title']).to eq @post.title
          end

          it "returns user_id for this post" do
            weekly_theme = json['theme_group']['weekly_themes'].first
            post = weekly_theme['posts'].first
            expect(post['user_id']).to eq @post.user.id
          end
        end
      end
    end
  end

  describe "#join" do

    before do
      post join_theme_group_path(@group), {}, authentication_headers(@user)
    end

    it "adds user to this group" do
      expect(@user.reload.member?(@group)).to eq true
    end
  end

  describe "#users" do

    context "when the user is a member of this group" do

      before do
        @user.join(@group)
        @user.save!

        get users_theme_group_path(@group), {}, authentication_headers(@user)
      end

      it "shows all users who are members of this group" do
        expect(json['users']).to be_present
        expect(json['users'].first['email']).to eq @user.email
      end
    end
  end
end
