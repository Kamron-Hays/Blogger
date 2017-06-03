Rails.application.routes.draw do
  root to: 'articles#index' # default page to render
  resources :articles
end
