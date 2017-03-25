Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  get "ugoal/show", to: "ugoal#show"
end
