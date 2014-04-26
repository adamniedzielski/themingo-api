
require 'spec_helper'

describe "Users" do
  
  describe "#create" do

    context "when all required params are provided and valid" do

      before do
        @params = FactoryGirl.attributes_for(:user)
      end

      it "creates a new user" do
        expect do
          post user_registration_path, { :user => @params }
        end.to change { User.count }.by(1)
      end

      it "responds with authentication token" do
        post user_registration_path, { :user => @params }
        expect(json["authentication_token"]).to be_present
      end

      context "when some optional params are provided" do

        before do
          @params[:first_name] = "John"
        end

        it "uses these params to create a new user" do
          post user_registration_path, { :user => @params }
          expect(User.last.first_name).to eq "John"
        end
      end
    end

    context "when some required parameters are not provided" do

      before do
        post user_registration_path, { :user => { :first_name => "John" } }
      end
 
      it "responds with status error" do
        expect(response.status).to eq 500
      end

      it "responds with an array of errors" do
        expect(json["errors"]).to be_present
        expect(json["errors"]).to be_an Array
      end
    end
  end

  describe "#update" do

    before do
      @user = FactoryGirl.create(:user)
    end

    context "when new valid value for attribute is provided" do

      before do
        @user.first_name = "John"
        @user.save!
      end

      it "updates the attribute" do
        expect do
          patch users_path, { :user => { :first_name => "Jack" } },
                authentication_headers(@user)
        end.to change { @user.reload.first_name }.from("John").to("Jack")
      end
    end
  end

  describe "#destroy" do

    before do
      @user = FactoryGirl.create(:user)
    end

    it "completely removes user from the database" do
      expect do
        delete users_path, {}, authentication_headers(@user)
      end.to change { User.count }.by(-1)
    end
  end

  describe "#show" do

    before do
      @user = FactoryGirl.create(:user)
      @another_user = FactoryGirl.create(:user)
      allow(User).to receive(:find) { @another_user }
    end

    context "when given user is a friend of current user" do

      before do
        allow(@another_user).to receive(:friend?) { true }
        get user_path(@another_user), {}, authentication_headers(@user)
      end

      it "shows personal data of this user" do
        expect(json['user']).to be_present
        expect(json['user']['email']).to eq @another_user.email
        expect(json['user']['nickname']).to eq @another_user.nickname
      end
    end

    context "when given user is *not* a friend of current user" do

      before do
        allow(@another_user).to receive(:friend?) { false }
        get user_path(@another_user), {}, authentication_headers(@user)
      end

      specify "response status should be unauthorized" do
        expect(response.status).to eq 401
      end
    end
  end
end
