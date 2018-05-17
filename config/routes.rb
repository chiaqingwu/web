Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :equipments, :foods, :grounds, :rentcars, :costumes, :photography, :custommade
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  if Rails.env.development?
     mount LetterOpenerWeb::Engine, at: "/letter_opener"
   end

   
end