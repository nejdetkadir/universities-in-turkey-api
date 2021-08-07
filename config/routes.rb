Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, module: "api/v1", defaults: { format: :json }

  # get '/profile', to: "profile#show"

  scope 'api/v1', module: 'api/v1' do
    resources :universities
    resources :colleges
    resources :faculties
    resources :departments
  end
end
