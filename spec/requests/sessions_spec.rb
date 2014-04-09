require 'spec_helper'

describe "Sessions" do
  
  describe "sign in" do

    context "with valid credentials" do

      before do
        @user = FactoryGirl.create(:user, :password => "goodpassword")
      end

      it "responds with authentication token" do
        post user_session_path, :user => { :email => @user.email, :password => "goodpassword" }
        expect(response.status).to eq 200
        expect(json["authentication_token"]).to be_present
      end
    end

    context "with invalid credentials" do

      it "responds with error" do
        post user_session_path, :user => { :email => "wrong@wrong.com", :password => "wrong" }
        expect(response.status).to eq 401
        expect(json["error"]).to eq "Invalid email or password."
      end
    end
  end

  describe "sign out" do

    context "when user is signed in" do

      before do
        @user = FactoryGirl.create(:user)
      end

      it "resets authentication token" do
        expect do
          delete destroy_user_session_path, {}, authentication_headers(@user)
        end.to change { @user.reload.authentication_token }
        expect(response.status).to eq 200
      end
    end
  end
end
