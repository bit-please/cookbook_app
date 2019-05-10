class Api::RecipesController < ApplicationController

	def index
		@recipes = Recipe.all #array of recipe hashes
		render 'index.json.jbuilder'
	end

	def show
		@recipe = Recipe.find(params[:id]) #one recipe hash
		render 'show.json.jbuilder'
	end

end	
