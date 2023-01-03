Rails.application.routes.draw do
  root "products#index"

  resources :products
  get "/total", to: "products#total_price"
  get "/discount", to: "products#discount"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
