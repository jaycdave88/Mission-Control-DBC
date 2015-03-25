require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe 'GET #signup' do
    it "renders user signup form page" do
      get :new
      expect(response.status).to eq(200)
    end
  end

end