Rails.application.routes.draw do

  

  namespace :api do
      resources :games
      resources :game_developers
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  end

root to: "home#index"

post "refresh", controller: :refresh, action: :create
post "signin", controller: :signin, action: :create
post "signup", controller: :signup, action: :create
delete "signin", controller: :signin, action: :destroy

end