Rails.application.routes.draw do

  # Organizations routes
  resources :organizations

  # Projects and Project-Event routes
	resources :projects do
		resources :events, only: [:show, :update]
	end

  # Donors routes
  resources :donors, except: [:index]

  # resource :donors, only: []  do
  #   resources :sessions, only: [:create]
  #   get '/sessions' => 'sessions#donors_new', as: 'login'
  #   delete '/sessions' => 'sessions#destroy', as: 'logout'
  # end

end
