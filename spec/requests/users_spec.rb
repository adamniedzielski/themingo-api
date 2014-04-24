
require 'spec_helper'

describe "Users" do
  
  describe "#create" do

    context "when all params are valid" do

      before do
        @params = FactoryGirl.attributes_for(:user)
      end

      it "creates a new user" do
        expect do
          post user_registration_path, @params
        end.to change { User.count }.by(1)
      end
    end
  end

  describe "#update" do

    context "when new value for attribute is provided" do

      it "updates the old value"
    end
  end

  describe "#destroy" do

    it "completely removes user from the database"
  end

  describe "#show" do

    context "when given user is a friend of current user" do

      it "shows personal data of this user"
    end

    context "when given user is *not* a friend of current user" do

      specify "response status should be unauthorized"
    end
  end
end
