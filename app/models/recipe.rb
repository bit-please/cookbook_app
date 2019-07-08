class Recipe < ApplicationRecord

	belongs_to :user
	has_many :recipe_categories
	has_many :categories, through: :recipe_categories
	validates :title, length: {minimum: 2}
	validates :ingredients, :directions, presence: true

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
