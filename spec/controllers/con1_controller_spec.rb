require 'spec_helper'

describe Con1Controller do
  describe "Get index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    
    it "@name should be guest if there are no data in users table" do
      FactoryGirl.create(:user)
      get :index
      assigns[:name].should == "tanaka"
    end
    
    it "@name should be guest if there are no data in users table" do
      get :index
      assigns[:name].should == "guest"
    end
  end
end