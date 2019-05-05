class Car < ApplicationRecord
	validates :year, presence: true, numericality: { only_integer: true }

	def setup(params)
	  	self.year = params.fetch(:year, 1)
	  	self.make = params.fetch(:make, "automobile")
	  	self.model = params.fetch(:model, "car")
	  	self.coolness_value = params.fetch(:coolness_value, 1)
	  	self.horsepower = params.fetch(:horsepower, 1)
	  	self.torque = params.fetch(:torque, 1)
	  	self.weight = params.fetch(:weight, 1)
  	end

  	def calculate_power_to_weight_ratio
  		self.horsepower.fdiv(self.weight)
  	end
end
