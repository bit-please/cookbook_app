class Api::RecipesController < ApplicationController

	# before_action :authenticate_user

	def index
		@recipes = Recipe.where("title iLIKE ?", "%#{params[:search]}%").order(:id)
		render 'index.json.jbuilder'
	end

	def show
		@recipe = Recipe.find(params[:id]) #one recipe hash
		render 'show.json.jbuilder'
	end

	def create
		@recipe = Recipe.new(
			title: params[:title],
			chef: params[:chef],
			prep_time: params[:prep_time],
			ingredients: params[:ingredients],
			directions: params[:directions]
		)
		@recipe.save
		render 'show.json.jbuilder'
	end

	def update
		@recipe = Recipe.find(params[:id])

		@recipe.title = params[:title] || @recipe.title
		@recipe.chef = params[:chef] || @recipe.chef
		@recipe.prep_time = params[:prep_time] || @recipe.prep_time
		@recipe.ingredients = params[:ingredients] || @recipe.ingredients
		@recipe.directions = params[:directions] || @recipe.directions

		@recipe.save
		render 'show.json.jbuilder'
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		render json: {message: "Recipe successfully destroyed!"}
	end

end	