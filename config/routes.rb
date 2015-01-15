require 'api_constraints'

Rentlever::Application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1,default: :true) do
      resources :units
    end
  end
end
