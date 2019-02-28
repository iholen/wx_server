Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  resources :wx, only: :index
  post "/wx", to: "wx#handle", as: "wx"
end
