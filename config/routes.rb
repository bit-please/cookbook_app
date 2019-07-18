Rails.application.routes.draw do

	namespace :api do
		get "/recipes" => "recipes#index"
		get "/recipes/:id" => "recipes#show"
		post "/recipes" => "recipes#create"
		patch "/recipes/:id" => "recipes#update"
		delete "/recipes/:id" => "recipes#destroy"

		post "/users" => "users#create"
		get "/users/me" => "users#show"
		post "/sessions" => "sessions#create"

		get "/categories" => "categories#index"

		get "/messages" => "messages#index"
		post "/messages" => "messages#create"
	end

	get "/recipes" => "recipes#index"
	get "/recipes/new" => "recipes#new"
	post "/recipes" => "recipes#create"
	get "/recipes/:id" => "recipes#show"
	get "/recipes/:id/edit" => "recipes#edit"
	patch "/recipes/:id" => "recipes#update"
	delete "/recipes/:id" => "recipes#destroy"

	get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]] }

end
