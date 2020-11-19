Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cocktails do
    resources :ingredients, only: %i[index edit]
    resources :doses, only: %i[index edit]
  end
end
