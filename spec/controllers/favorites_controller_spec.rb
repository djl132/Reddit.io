require 'rails_helper'
 include SessionsHelper

 RSpec.describe FavoritesController, type: :controller do

   let(:my_topic) { create(:topic) }
   let(:my_user) { create(:user) }
   let(:my_post) { create(:post, topic: my_topic, user: my_user) }

   context 'guest user' do
     describe 'POST create' do
       it 'redirects the user to the sign in view' do
         post :create, { post_id: my_post.id }
 # #7
         expect(response).to redirect_to(new_session_path)
       end
     end
   end

   context 'signed in user' do
     before do
       create_session(my_user)

     end

     describe 'POST create' do
 # #8

       it 'creates a favorite for the current user and specified post' do
 # #9

         expect(my_user.favorites.find(my_post.id)).to be_nil

         post :create, { post_id: my_post.id }

         puts my_user.favorites.inspect

 # #10
         expect(my_user.favorites.find(my_post.id)).not_to be_nil
       end

       it 'redirects to the posts show view' do
         post :create, { post_id: my_post.id }
         expect(response).to redirect_to([my_topic, my_post])
       end

     end
   end
 end
