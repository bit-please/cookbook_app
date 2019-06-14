json.array! @recipes.each do |recipe|
	json.partial! "recipe.json.jbuilder", recipe: recipe
	json.user do
		json.partial! recipe.user, partial: "api/users/user", as: :user
	end
end