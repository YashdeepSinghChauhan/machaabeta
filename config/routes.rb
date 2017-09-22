Rails.application.routes.draw do

 devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources  :posts do
	collection do 
		get 'search'
	end
resources :reviews
end
root 'posts#index'
resources :users, :only => [:show]
end

