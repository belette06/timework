Rails.application.routes.draw do
  get 'depannages/new'
  get 'depannages/edit'
  get 'depannages/show'
  get 'depannages/index'

  authenticated :user, ->(user) {user.admin?} do
    get 'admin', to: 'admin#index'
    get 'admin/users'
    get 'admin/show_user/:id', to: "admin#show_user", as: 'admin_user'
    get 'admin/weektimes'
    get 'admin/show_weektime/:id', to: "admin#show_weektime", as: 'admin_weektime'
    get 'admin/affaires'
    get 'admin/show_affaire/:id', to: "admin#show_affaire", as: 'admin_affaire'
  end


  root 'pages#index'

  devise_for :users, controllers: {
                                    sessions: 'users/sessions',
                                    registrations:'users/registrations'
                                  }


authenticated :user, ->(user) {user.admin?} do
  resources :weektimes do
    resources :worktimes
  end
  post "/worktimes/:id/toggle", to: "worktimes#toggle", as: 'worktimes_checkbox' #bouton checkbox worktime
  post "/worktimes/:id/upper", to: "worktimes#upper", as: 'worktimes_checkbox_all' #bouton checkbox_all worktime
  post "/weektimes/:id/toggle", to: "weektimes#toggle", as: 'weektimes_checkbox' #bouton checkbox weektime
  
  resources :profiles
end


  resources :adresses
  resources :affaires


  
  
end
