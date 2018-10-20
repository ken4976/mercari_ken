Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'items#index'
  resources :users , only: [:show] do
    member do
      get 'notification'
      get 'todo'
      get 'like_history'
      get 'news'
      get 'review_history'
      get 'review_history_great'
      get 'review_history_good'
      get 'review_history_poor'
    end
  end
  resources :payjps, only: [:show, :new, :create]
  resources :addresses, only: [:new, :create, :edit, :update]
  resources :credits, only: [:index, :new, :create, :destroy]
  resources :items do
    collection do
      get 'search'
    end
  end
  resources :categories, only: [:show]
  resources :brands, only: [:show]

  namespace :purchase_pre do
    resources :items, only: [:show,:update]
  end

  namespace :order_status do
    resources :items, only: [:index,:show] do
      collection do
        get 'pre_index'
      end
    end
  end

  namespace :listings do
    resources :items, only: [:index, :show]
  end

  namespace :in_progress do
    resources :items, only: [:index, :show]
  end

  namespace :completed do
    resources :items, only: [:index, :show]
  end

  namespace :purchase do
    resources :items, only: [:index, :show]
  end

  namespace :purchased do
    resources :items, only: [:index, :show]
  end

  namespace :profile do
    resources :users, only: [:edit, :update]
  end

  get 'mains/profile', to: 'mains#profile'
  get 'mains/card', to: 'mains#card'
  get 'mains/card_new', to: 'mains#creditnew'
  get 'mains/card_after', to: 'mains#creditafter'
  get 'mains/email_password', to: 'mains#email_password'
  get 'mains/identification', to: 'mains#identification'
  get 'mains/sms_confirmation', to: 'mains#sms_confirmation'
  get 'mains/logout', to: 'mains#logout'
  get 'mains/sales_transfer', to: 'mains#sales_transfer'
  get 'mains/points_confirmation', to: 'mains#points_confirmation'
  get 'mains/points_history', to: 'mains#points_history'
  get 'mains/points_limit', to: 'mains#points_limit'
  get 'mains/sales_history', to: 'mains#sales_history'
  get 'mains/sales_tra_lim', to: 'mains#sales_tra_lim'
  get 'mains/sales_tra_bank', to: 'mains#sales_tra_bank'
  get 'mains/sales_tra_history', to: 'mains#sales_tra_history'
  get 'mains/sales_tra_account_register', to: 'mains#sales_tra_account_register'

  get 'mains/top', to: 'mains#mypage'
  get 'mains/notification', to: 'mains#mypage_notification'
  get 'mains/todo', to: 'mains#mypage_todo'
  get 'mains/purchase', to: 'mains#mypage_purchase'
  get 'mains/purchased', to: 'mains#mypage_purchased'
  get 'mains/news', to: 'mains#mypage_news'
  get 'mains/account', to: 'mains#account'

  get 'tests/order_status_waiting', to: 'tests#order_status_waiting'
  get 'tests/account', to: 'tests#account'
  get 'tests/order_status_after_shipping', to: 'tests#order_status_after_shipping'

end
