Rails.application.routes.draw do

  resources :schedules, only: [:index, :create, :update, :destroy]

end
