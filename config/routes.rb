Rails.application.routes.draw do
  resources :projects do
    resources :materials
  end
  # namespace :project do
  #   resources :materials
  # end
  resources :projects do
    resources :labours
  end
  # namespace :project do
  #   resources :labours
  # end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "projects#index"
end
