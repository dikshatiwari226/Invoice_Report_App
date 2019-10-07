Rails.application.routes.draw do

  resources :invoices
  devise_for :users
  
	root 'welcome#index'

	namespace :admin, module: nil  do
    root "admin#index"
    resources :users
  end
end
