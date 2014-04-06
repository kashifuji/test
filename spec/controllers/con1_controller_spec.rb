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
  describe "Get error" do
    it "responds HTTP 404 status code" do
      get :error
      expect(response.status).to eq(404)
    end
  end
  describe "Get form" do
    it "responds successfully with an HTTP 200 status code" do
      get :form
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
  describe "Post form" do
    it "post with :name=suzuki. redirect /con1/result" do
      post :form, {:user => {:name => "suzuki"}}
      response.should redirect_to "/con1/result"
    end
    
    it "post with :name is empty. not redirect /con1/result" do
      post :form, {:user => {:name => ""}}
      #expect(response).to be_success
      #expect(response.status).to eq(200)
      expect(response).to render_template("form")
    end

    it "post with :name is 21 length. not redirect /con1/result" do
      post :form, {:user => {:name => "123456789012345678901"}}
      #expect(response).to be_success
      #expect(response.status).to eq(200)
      expect(response).to render_template("form")
    end
    
    it "post with :test=test. not redirect /con1/result" do
      post :form, {:user => {:test => "test"}}
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response).to render_template("form")
    end
  end
end