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
  describe "Get form2" do
    it "xml responds successfully with an HTTP 200 status code" do
      get :form2
      xml = Nokogiri::XML(response.body)
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(xml.xpath('/objects').size).to eq(1)
      expect(xml.xpath('/objects/object/name').size).to eq(2)
      expect(xml.xpath('/objects/object/name')[0].inner_text).to eq("taro")
      expect(xml.xpath('/objects/object/name')[1].inner_text).to eq("jiro")
      expect(xml.xpath('/objects/object/old').size).to eq(2)
      expect(xml.xpath('/objects/object/old')[0].inner_text).to eq("45")
      expect(xml.xpath('/objects/object/old')[1].inner_text).to eq("40")
    end
  end
  describe "Post form2" do
    it "json responds successfully with an HTTP 200 status code" do
      post :form2, {:parse => "json"}
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(json.size).to eq(2)
      expect(json[0]['name']).to eq('taro')
      expect(json[0]['old']).to eq(45)
      expect(json[1]['name']).to eq('jiro')
      expect(json[1]['old']).to eq(40)
    end
  end
end