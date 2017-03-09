Rails.application.routes.draw do

# CREATE ROUTES FOR CRUD OEPRATIONS ON A RESOURCE
  resources :topics do

    resources :posts, except: [:index]

  end

    resources :users, only: [:new, :create]
    post 'users/confirm', to: "users#confirm"

    get 'about' => "welcome#about"



  root 'welcome#index'
end
