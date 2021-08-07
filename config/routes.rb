Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/profile', to: "profile#show"

  scope 'api/v1', module: 'api/v1' do
    scope module: 'users' do
      devise_for :users, defaults: { format: :json }
    end

    resources :universities, only: [:index, :create, :destroy]
    resources :colleges, only: [:index, :create, :destroy]
    resources :faculties, only: [:index, :create, :destroy]
    resources :departments, only: [:index, :create, :destroy]
  end
end
