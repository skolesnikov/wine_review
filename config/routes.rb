WineReview::Application.routes.draw do
  get "/wines" => "wines#index", as: 'wines'
  get "/wines/:id" => "wines#show", as: 'wine'
end
