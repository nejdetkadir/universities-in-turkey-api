Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, module: "api/v1", defaults: { format: :json }

  get '/profile', to: "profile#show"
end
