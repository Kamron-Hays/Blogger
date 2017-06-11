Blogger::Application.routes.draw do # was Rails.application.routes.draw do
  root to: 'articles#index' # default page to render
  resources :articles do
    resources :comments
  end
  resources :tags
end
