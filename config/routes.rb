Rails.application.routes.draw do

  devise_for :users

  root to: "top#index"  

  resources :users, only: "show" do
    resources :user_goals, only: %i(new create), as: "goal", path: "goal"
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :groups, only: %i(show new edit create update)
  resources :group_invitations, only: %i() do
    member do
      get "confirm"
    end
  end
end
