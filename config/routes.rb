Rails.application.routes.draw do
  resources :apartments
  get '/apartments/user/:user_id' => 'apartments#show_by_user'
  devise_for :users, defaults: {format: :json}, controllers: { sessions: 'users/sessions', registrations: "users/registrations" }
  get '/users/:id' => 'information#show_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
