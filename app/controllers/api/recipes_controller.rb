class Api::RecipesController < ApplicationController

	def index
		@recipes = Recipe.all #array of recipe hashes
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

end	
