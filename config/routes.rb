Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web, at: "/sidekiq"

  root  to: 'currency#index'
  get  :admin, to: "admin#index"
  post :set_currency, to: "admin#set_currency"
end
