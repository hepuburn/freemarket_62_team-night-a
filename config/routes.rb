Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :signup, only: [:index, :create], path: "/signup" do
    collection do
      get 'index'
      get 'member'
      get 'sms'
      get 'done', to: 'signup#create' # 入力した情報すべてを保存
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items

  resources :users, only: [:show] do
    collection do
      get 'mypage'
      get 'logout'
    end
  end

  resources :categories, only: [:index]
end
