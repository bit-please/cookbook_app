class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
		render 'index.html.erb'
	end

	def new
		render 'new.html.erb'
	end

	def create
		@recipe = Recipe.new(
			title: params[:title],
			prep_time: params[:prep_time],
			ingredients: params[:ingredients],
			directions: params[:directions],
			image_url: params[:image_url],
			user_id: params[:user_id]
		)
		@recipe.save
		redirect_to "/recipes/#{@recipe.id}"
	end

	def show
		@recipe = Recipe.find(params[:id])
		render 'show.html.erb'
	end

	def edit
		@recipe = Recipe.find(params[:id])
		render 'edit.html.erb'
	end

	def update
		@recipe = Recipe.find(params[:id])

		@recipe.title = params[:title]
		@recipe.prep_time = params[:prep_time]  
		@recipe.ingredients = params[:ingredients] 
		@recipe.directions = params[:directions] 
		@recipe.image_url = params[:image_url] 

		@recipe.save
		redirect_to "/recipes/#{@recipe.id}"
	end

end
