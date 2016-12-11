Rails.application.routes.draw do
  root to: "home#index"

  resources :categories

  resources :brands do
  	resources :products
  end

  devise_for :users, controllers: {
  	sessions: 'users/sessions'
	} 

	get '/rolypoly' => "home#game"
end
