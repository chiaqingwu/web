Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :products
  resources :people_numbers
  resources :activity_kinds
  resources :regions
  resources :categories

  resources :equipments, :foods, :grounds, :rentcars, :costumes, :photography, :custommade do
    collection do
      post :search
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  if Rails.env.development?
     mount LetterOpenerWeb::Engine, at: "/letter_opener"
   end

  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
      put :remove, path:'/:id'
    end
  end

  # put '/carts/:id', to: 'carts#update'

  mount Commontator::Engine => '/commontator'

end
