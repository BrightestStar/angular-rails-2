Rails.application.routes.draw do
  devise_for :users
  root to: 'application#angular'

  resources :posts, only: [:create, :index, :show, :update] do
    resources :comments, only: [:create, :update, :show] do
      member do
        put '/upvote' => 'comments#upvote'
      end
    end

    member do
      put '/upvote' => 'posts#upvote'
    end
  end
end
