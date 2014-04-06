require 'spec_helper'

describe Con1Controller do
  describe "Get index" do
    before do
      get :index
    end
    it do
      response.should be_success
    end
  end
end