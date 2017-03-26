Rails.application.routes.draw do
  devise_for :users

  root to: "top#index"
  root to: "top#index"

  resources :users, only: "show" do
    resources :user_goals, as: "goal", path: "goal" do
      resources :activities
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :groups, only: %i(show new edit create update) do
    member do
      post "/add_to_group", to: "groups#add_to_group", as: "add_to"
    end
  end

  get "/open_groups", to: "groups#show_open_groups"

  resources :group_invitations, only: %i() do
    member do
      get "confirm"
    end
  end
  resources :goals, only: %i(show)
end
