WineReview::Application.routes.draw do
  resources :wines do
  	get 'page/:page', :action => :index, :on => :collection
  end
  
  root 'wines#index'
  #get "/wines" => "wines#index", as: 'wines'
  #get "/wines/new" => "wines#new", as: 'new_wine'
  #get "/wines/:id" => "wines#show", as: 'wine'
  #post "/wines" => "wines#create"
  #get "/wines/:id/edit" => "wines#edit", as: 'edit_wine'
  #patch "/wines/:id" => "wines#update"
  #delete "/wines/:id" => "wines#destroy"
end
