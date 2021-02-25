Rails.application.routes.draw do

  get 'sessions/new'
  get '/blogs', to: 'blogs#index'
  get '/stocks', to: 'stocks#index'

    resources :blogs do

    collection do
      post :confirm
    end
  end

# Bootstrap
  root to: 'tops#index'
    resources :blogs

# ユーザー新規登録
  resources :users, only: [:new, :create, :show]

# ログインシステム・ログアウトシステム
 resources :sessions, only: [:new, :create, :destroy]
 resources :users, only: [:new, :create, :show]

# お気に入り機能
resources :favorites, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
