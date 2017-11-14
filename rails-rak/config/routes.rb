Rails.application.routes.draw do


  post 'organization_token' => 'organization_token#create'
  post 'donor_token' => 'donor_token#create'
  resources :organizations do
    resources :projects, only: [:create]
  end

	resources :projects do
		resources :events, only: [:show, :update]
	end

  resources :donors, except: [:index]


end
