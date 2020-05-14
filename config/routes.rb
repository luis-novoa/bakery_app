Rails.application.routes.draw do
  get 'statics/fake_root'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index]
  root 'statics#fake_root'
end
