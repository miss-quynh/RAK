Rails.application.routes.draw do


  resources :organizations

	resources :projects do
		resources :events, only: [:show, :update]
	end

  resources :donors, except: [:index]


end
