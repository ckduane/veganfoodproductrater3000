Rails.application.routes.draw do
  root to: "home#index"

  get '/categories/:category_id' => 'categories#show', as: :category

  resources :products do
  	resources :reviews
  end

  resources :users

  devise_for :users, controllers: {
  	sessions: 'users/sessions'
	} 

end
