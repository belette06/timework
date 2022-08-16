Rails.application.routes.draw do
  

  

   root "pages#index"

   resources :weektimes do
    resources :worktimes 
   end
   resources :affaires

   devise_for :users

end
