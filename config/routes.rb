Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :games, except: [:new, :edit] do
        # resources :cards, except: [:new, :edit]
        resources :players, except: [:new, :edit]
     end
    end
  end
end
