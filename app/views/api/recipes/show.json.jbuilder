json.partial! "recipe.json.jbuilder", recipe: @recipe

json.formatted do
	json.created_at @recipe.friendly_created_at
	json.prep_time @recipe.friendly_prep_time
	json.ingredients @recipe.ingredients_list
	json.directions @recipe.directions_list
end

# only show user object if it matches current_user
if current_user == @recipe.user
	json.user do
		json.partial! @recipe.user, partial: "api/users/user", as: :user
	end
end
