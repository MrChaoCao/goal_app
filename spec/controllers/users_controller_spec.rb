require 'rails_helper'

RSpec.describe UsersController, type: :controller do
 #show
 describe 'GET #show' do
  it 'renders the specific user\'s page' do
    User.create(username: "username", password: "password")
    id = User.last.id
    get :show, params: { id: id }
    expect(response).to render_template('show')
    expect(response).to have_http_status(200)
  end
end
 #index
 describe 'GET #index' do
   it 'renders the users index page' do
     get :index, {}
     expect(response).to render_template('index')
     expect(response).to have_http_status(200)
   end
 end
 #new
  describe 'GET #new' do
    it 'renders the new user page' do
      get :new, params: {  user: {} }

      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end
 #create
   describe 'POST #create' do
     context 'with invalid params' do
      it 'validates the presence of username and password' do
        post :create, params: { user: {username: '', password: 'password'} }
        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end
    end

     context 'with valid params' do
       it 'redirects to the user show page' do
         post :create, params: { user: {username: 'username99', password: 'password'}}
         expect(response).to redirect_to(user_url(User.last))
       end
     end
   end
end
