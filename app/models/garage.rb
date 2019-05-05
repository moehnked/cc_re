# require 'car'
require_relative "user"

class Garage < ApplicationRecord
	belongs_to :user
	has_many :cars

	def setup(user= User.new)
		self.user = user
		self.cars = []
	end

	def total_coolness
	 	cars.sum(:coolness_value)
	end

	def add(car = Car.new)
	 	cars << car
	end

	def lame?
	 	cars.empty?
	end

	def car_count
	 	cars.size
	end
end
