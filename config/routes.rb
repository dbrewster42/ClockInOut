Rails.application.routes.draw do
  get 'home' =>'clocks#new'
  get 'timesheets' =>'clocks#index'   
  post 'clockin' =>'clocks#clockin'
  patch "clocks/:id" =>'clocks#clockout'
  get "clocks/:id/edit" =>'clocks#edit'
  patch "clocks/:id/edit" =>'clocks#update'
  get "clocks/:id" =>'clocks#show'

  get "jobs" => "jobs#index"
  get "jobs/new" => "jobs#new"
  post "jobs" => "jobs#create"
  get "jobs/:id" => "jobs#show"
  get "jobs/:id/edit" => "jobs#edit"
  patch "jobs/:id" => "jobs#update"
  delete "jobs/:id" => "jobs#destroy"

  get '/' =>'users#new'
  post 'users' =>'users#create'
  post '/' =>'users#login'
  get 'users/:id' =>'users#show'
  patch 'users/:id' =>'users#update'
  delete 'users/:id/logout' =>'users#logout'
  get 'error' =>'users#error'

  match '*path' => redirect('/error'), via: :get

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
