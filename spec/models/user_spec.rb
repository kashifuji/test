require 'spec_helper'

describe User do
  describe 'Model User' do
    before do
      FactoryGirl.create(:user)      
    end
    subject { User.all }
    it { should have(1).items }
  end
end