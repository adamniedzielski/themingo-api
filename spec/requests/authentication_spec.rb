require 'spec_helper'

describe "Authentication" do

  it "is required to access most of the content" do
    get users_path
    expect(response.status).to eq 401
  end

  it "requires X-USER-EMAIL and X-USER-TOKEN headers" do
    user = FactoryGirl.create(:user)

    get users_path, {}, authentication_headers(user)
    expect(response.status).to eq 200
  end
end
