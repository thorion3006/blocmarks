Rails.application.routes.draw do

  devise_for :users, controllers: {
                      registrations: 'users/registrations',
                      sessions: 'users/sessions',
                      passwords: 'users/passwords',
                      confirmations: 'users/confirmations'
                    }

  resources :topics do
    resources :bookmarks, except: :index
  end
  resources :bookmarks, only: [] do
    resources :likes, only: [:index, :create, :destroy]
  end
  resources :users, only: :show

  get 'home' => 'welcome#index'

  post :incoming, to: 'incoming#create'

  root 'root#root_toggle'

  # For LetterOpenerWeb
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
