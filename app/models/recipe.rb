class Recipe < ApplicationRecord

	# def ingredients
	# 	@ingredients
	# end

	# model method
	def ingredients_list
		ingredients.split(", ")
	end

	def directions_list
		directions.split(", ")
	end

	def friendly_created_at
		created_at.strftime("%A, %b %d")
	end

	def friendly_prep_time
		hours = prep_time / 60
		minutes = prep_time % 60
		result = ""
		result += "#{hours} hours " if hours > 0
		result += "#{minutes} minutes" if minutes > 0
		result
	end

end