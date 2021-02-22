Rails.application.routes.draw do

  get '/blogs', to: 'blogs#index'
  get '/stocks', to: 'stocks#index'

    resources :blogs do

    collection do
      post :confirm
    end
  end

  root to: 'tops#index'  
    resources :blogs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
