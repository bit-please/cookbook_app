json.partial! "user.json.jbuilder", user: @user

json.recipes do
	json.array! @user.recipes, partial: "api/recipes/recipe", as: :recipe
end