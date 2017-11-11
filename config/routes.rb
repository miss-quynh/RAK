Rails.application.routes.draw do

	resources :projects do
		resources :events, only: [:show, :update]
	end

  resources :donor, except: [:index]

end
