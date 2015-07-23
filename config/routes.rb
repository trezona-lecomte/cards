Rails.application.routes.draw do
  resources :games, except: [:new, :edit], shallow: true do
    resources :cards, except: [:new, :edit]
    resources :players, except: [:new, :edit]
  end
end
