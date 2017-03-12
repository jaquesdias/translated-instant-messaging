require 'rails_helper'

describe ApplicationController do
  describe "GET #check_current_user" do
    context "When there is a current_user" do
      it "Returns a successful 200 response" do
        expect(response).to be_success
      end
    end
  end
end
