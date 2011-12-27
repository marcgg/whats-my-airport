require "spec_helper"

describe UsersController do
  describe "GET new" do
    it "should work" do
      get :new
      response.should be_success
      assigns(:user).should_not be_nil
    end
  end

  describe "POST create" do
    it "should create the user when given a valid name" do
      post :create, user: {name: "Jean-Gerard"}
      User.last.name.should == "Jean-Gerard"
      response.should redirect_to result_path(id: User.last.id)
    end

    it "should fail gracefully" do
      lambda{
        post :create, user: {}
        response.should redirect_to root_path
      }.should_not change(User, :count)
    end
  end

  describe "GET show" do
    before(:each) do
      @user = User.create!(name: "Hey")
    end

    it "should show the given user" do
      get :show, id: @user.id
      response.should be_success
      assigns(:user).should == @user
    end
  end
end
