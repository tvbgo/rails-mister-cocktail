Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails do
    resources :ingredients, only: %i[index]
    resources :doses, only: %i[new create]
  end
  resources :doses, only: :destroy
  resources :ingredients, only: :destroy

  patch 'cocktails/:id/edit', to: 'cocktails#update'
end
