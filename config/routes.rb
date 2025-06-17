Rails.application.routes.draw do
  get "items/index"
  get "items/show"
  get "items/create"
  get "items/update"
  get "items/destroy"
  get "invoice_items/index"
  get "invoice_items/show"
  get "invoice_items/create"
  get "invoice_items/update"
  get "invoice_items/destroy"
  get "invoices/index"
  get "invoices/show"
  get "invoices/create"
  get "invoices/update"
  get "invoices/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :customers
  resources :items
  resources :invoices
  resources :invoice_items

end
