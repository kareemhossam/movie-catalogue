# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Actors
      get 'actors/:id', to: 'actors#show'
      get 'actors', to: 'actors#index'

      # Movies
      get 'movies/:id', to: 'movies#show'
      get 'movies', to: 'movies#index'
    end
  end
end
