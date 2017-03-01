Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  get 'welcome/faq' #route faq - calls the welcome controller's faq action.

  root 'welcome#index'
end
