Rails.application.routes.draw do

# CREATE ROUTES FOR CRUD OEPRATIONS ON A RESOURCE
  resources :topics do

    resources :posts, except: [:index]

  end


  # At #4, we use only: [] because we don't want to create any /posts/:id routes, just posts/:post_id/comments routes.

# WAHT DOES THAT MEAN?
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]

# voting routes

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote


  get 'about' => "welcome#about"

  root 'welcome#index'
end
