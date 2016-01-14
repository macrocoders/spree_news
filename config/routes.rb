Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :news
  end
  resources :news, only: [:index, :show]#, path: :news
end
