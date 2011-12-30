require "spec_helper"

describe AdminController do
  describe "GET logout" do
    it "should redirect to admin path and reset the session" do
      session[:is_admin] = true
      get :logout
      response.should redirect_to admin_path
      session[:is_admin].should == false
    end
  end

  describe "GET index" do
    before :each do
      SHA1_PASSWORD = "sha"
    end

    it "should authenticate if a password is sent" do
      mock(Digest::SHA1).hexdigest("abcd"){"sha"}
      get :index, password: "abcd"
      response.should redirect_to admin_path
      session[:is_admin].should be_true
    end

    it "should authenticate if a password is sent and fail if the password is wrong" do
      mock(Digest::SHA1).hexdigest("abcd"){"notsha"}
      get :index, password: "abcd"
      response.should redirect_to admin_path(:error => "Invalid Password")
      session[:is_admin].should be_false
    end

    it "should show users if the user is logged in" do
      session[:is_admin] = true
      mock(User).all.with_any_args{["users"]}
      get :index
      response.should be_success
      assigns(:logged_in).should be_true
      assigns(:users).should == ["users"]
    end

    it "should do nothing if the user is not logged in" do
      session[:is_admin] = false
      get :index
      response.should be_success
      assigns(:users).should be_nil
      assigns(:logged_in).should be_false
    end
  end
end
