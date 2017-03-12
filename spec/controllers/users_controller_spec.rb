require 'rails_helper'

describe UsersController do
  let(:params){ { username: "Jaques", dialect: "pirate" } }
  let(:empty_params){ { username: nil, dialect: nil } }
  let(:current_user){ { current_user: { username: params[:username], dialect: params[:dialect] } } }

  describe "GET #new" do
    context "When the action is called" do
      it "Returns a successful 200 response" do
        expect(response).to be_success
      end
    end
  end

  describe "POST #create" do
    context "When there are username and dialect params" do
      it "Redirects to root_path" do
        post :create, params: params, session: current_user
        expect(response).to redirect_to(root_path)
      end
    end

    context "When there aren't username and dialect params" do
      it "Redirects to new_user_path" do
        post :create, params: empty_params
        expect(response).to redirect_to(new_user_path)
      end
    end
  end

  describe "GET #active_users" do
    context "When the action is called" do
      it "Returns a successful 200 response" do
        get :active_users, xhr: true, session: current_user
        expect(response).to be_success
      end

      it "Render the :active_users template" do
        get :active_users, xhr: true
        expect(controller.instance_variable_get(:@users)).to eq(nil)
      end
    end
  end
end
