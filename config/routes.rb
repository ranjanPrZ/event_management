Rails.application.routes.draw do
  root to: 'events#index'

  get 'login', to: 'sessions#new'
  post 'logged_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  post 'register', to: 'users#create'

  get 'event_details/:id', to: 'events#show', as: 'event_details'
  post 'attend/:id', to: 'events#attend', as: 'attend'

  get 'gender_discount', to: 'tickets#gender_based_discount'
  get 'token_generator', to: 'tickets#token_generator'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
