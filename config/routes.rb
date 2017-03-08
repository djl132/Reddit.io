Rails.application.routes.draw do
# CREATE ROUTES FOR CRUD OEPRATIONS ON A RESOURCE
  resources :topics do

    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]

  end

  get 'about' => "welcome#about"

  root 'welcome#index'
end
