require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET #index' do
    it 'should be successfull response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should create a new instance of @message" do
      get :index
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "should renders the index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create_message' do
    context 'with valid parameters' do
      it 'creates a new message' do
        expect do
          post :create_message, params: { message: { person_name: 'joao', person_mail: 'joao@example.com', description: 'Hello' } }
        end.to change(Message, :count).by(1)
      end

      it 'redirects to the welcome_index_path' do
        post :create_message, params: { message: { person_name: 'joao', person_mail: 'joao@example.com', description: 'Hello' } }
        expect(response).to redirect_to(welcome_index_path)
      end

      it 'sets a success flash message' do
        post :create_message, params: { message: { person_name: 'joao', person_mail: 'joao@example.com', description: 'Hello' } }
        expect(flash[:success]).to be_present
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new message' do
        expect do
          post :create_message, params: { message: { person_name: '', person_mail: '', description: '' } }
        end.not_to change(Message, :count)
      end

      it 'redirects to the welcome_index_path' do
        post :create_message, params: { message: { person_name: '', person_mail: '', description: '' } }
        expect(response).to redirect_to(welcome_index_path)
      end

      it 'sets an error flash message' do
        post :create_message, params: { message: { person_name: '', person_mail: '', description: '' } }
        expect(flash[:error]).to be_present
      end
    end
  end
end