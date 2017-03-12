require 'rails_helper'

describe MessagesController do
  let(:params){ { username: "Jaques", dialect: "pirate", message: { description: "Dead men tell no tales" } } }
  let(:current_user){ { current_user: { username: params[:username], dialect: params[:dialect] } } }
  let(:invalid_attributes) { { message: { description: nil } } }
  let(:translation_object) { double('translation_object') }

  describe "GET #new" do
    context "When the action is called" do
      it "Returns a successful 200 response" do
        expect(response).to be_success
      end
    end
  end

  describe "GET #index" do
    context "When the action is called" do
      it "Returns a successful 200 response" do
        expect(response).to be_success
      end

      it "Renders the :index template" do
        get :index
        expect(controller.instance_variable_get(:@message)).to eq(nil)
      end
    end
  end

  describe "POST #create" do
    before do
      allow(Translation).to receive(:new).with(current_user[:dialect]).and_return(translation_object)
      allow(translation_object).to receive(:translate).with("").and_return("")
    end

    context "when invalid" do
      it "does not create" do
        post :create, params: invalid_attributes, session: current_user
        expect(assigns(:message)).to be_a_new Message
        expect(assigns(:message).errors.size).to eq 3
        expect(response).to render_template :index
      end
    end
  end
end
