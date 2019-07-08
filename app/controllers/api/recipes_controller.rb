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
		if params[:image_url]
			response = Cloudinary::Uploader.upload(params[:image_url])
	    cloudinary_url = response["secure_url"]
	  end
		@recipe = Recipe.new(
			title: params[:title],
			prep_time: params[:prep_time],
			ingredients: params[:ingredients],
			directions: params[:directions],
			image_url: cloudinary_url || "default.png"
		)
		if current_user
			@recipe.user_id = current_user.id
		else 
			@recipe.user_id = params[:user_id]
		end
		if @recipe.save
			category_ids = params[:category_ids].split(",")
			category_ids.each do |category_id|
				RecipeCategory.create(category_id: category_id, recipe_id: @recipe.id)
			end
			render 'show.json.jbuilder'
		else
			render json: {errors: @recipe.errors.full_messages}, status: :unprocessable_entity
		end
	end

	def update
		@recipe = Recipe.find(params[:id])

		@recipe.title = params[:title] || @recipe.title
		@recipe.prep_time = params[:prep_time] || @recipe.prep_time
		@recipe.ingredients = params[:ingredients] || @recipe.ingredients
		@recipe.directions = params[:directions] || @recipe.directions
		@recipe.image_url = params[:image_url] || @recipe.image_url

		if @recipe.save
			render 'show.json.jbuilder'
		else
			render json: {errors: @recipe.errors.full_messages}, status: 422
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		render json: {message: "Recipe successfully destroyed!"}
	end

end	
