require 'rails_helper'

RSpec.describe "Recipes", type: :request do
	before do
		user = User.create(name: "Bob", email: "bob@gmail.com", password: "password")
		Recipe.create(title: "Recipe 1", prep_time: 5, ingredients: "Ingredient 1, Ingredient 2", directions: "Direction 1, Direction 2", user_id: user.id)
		Recipe.create(title: "Recipe 2", prep_time: 10, ingredients: "Ingredient 1, Ingredient 2", directions: "Direction 1, Direction 2", user_id: user.id)
		Recipe.create(title: "Recipe 3", prep_time: 11, ingredients: "Ingredient 1, Ingredient 2", directions: "Direction 1, Direction 2", user_id: user.id)
	end

  describe "GET /recipes" do
    it "returns an array of 3 recipes" do
      get "/api/recipes"
      recipes = JSON.parse(response.body)
      expect(recipes.length).to eq(3)
    end
  end

  describe "GET /recipes/:id" do
  	it "returns the proper attributes for a recipes" do
  		id = Recipe.first.id
  		get "/api/recipes/#{id}"
  		recipe = JSON.parse(response.body)
  		expect(recipe["title"]).to eq("Recipe 1")
  		expect(recipe["prep_time"]).to eq(5)
  	end
  end

  describe "POST /recipes" do
  	it "creates a recipe" do
  		post "/api/recipes", params: {title: "Recipe 3", prep_time: 11, ingredients: "Ingredient 1, Ingredient 2", directions: "Direction 1, Direction 2", user_id: User.first.id}
  		recipe = JSON.parse(response.body)
  		expect(recipe["title"]).to eq("Recipe 3")
  	end
  	it "should return an error status code with invalid data" do
  		post "/api/recipes", params: {}
  		expect(response).to have_http_status(:unprocessable_entity)
  	end
  end

  describe "PATCH /recipes/:id" do
    it "updates a recipe" do
      id = Recipe.first.id
      patch "/api/recipes/#{id}", params: {title: "Updated name"}
      recipe = JSON.parse(response.body)
      expect(recipe["title"]).to eq("Updated name")
    end

    it "returns an error status code with invalid data" do
      id = Recipe.first.id
      patch "/api/recipes/#{id}", params: {title: ""}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE /recipes/:id" do
    it "deletes a recipe" do
      id = Recipe.first.id
      delete "/api/recipes/#{id}"
      expect(Recipe.count).to eq(2)
    end
  end

  
end


