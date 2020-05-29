Rails.application.routes.draw do
  root 'gyms#index'

  resources :gyms do
    resources :locations
  end

  resources :locations do
    resources :comment
  end
end
  

  