Rails.application.routes.draw do
  devise_for :users
  root to: 'application#angular'

  resources :posts do
    resources :comments do
      member do
        post '/upvote' => 'comments#upvote'
        post '/downvote' => 'comments#downvote'
      end
    end

    member do
      post '/upvote' => 'posts#upvote'
      post '/downvote' => 'posts#downvote'
    end
  end
end
