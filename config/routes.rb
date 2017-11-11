Rails.application.routes.draw do


  resources :organizations
  
	resources :projects do
		resources :events, only: [:show, :update]
	end

  resources :donor, except: [:index]


end
