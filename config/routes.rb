Rails.application.routes.draw do
  # donor routes
  resources :donor, except: [:index]

end
