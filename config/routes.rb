# frozen_string_literal: true

Rails.application.routes.draw do
  resources :schedules, only: %i[index create update destroy]
end
