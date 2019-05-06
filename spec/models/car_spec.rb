require 'rails_helper'

RSpec.describe Car, type: :model do
  let(:car) do
  	car = Car.new
  	car.setup

  	it "expects a new car to have all its parameters" do
  		expect(car.year).to eq(1)
  		expect(car.make).to eq("automobile")
  		expect(car.model).to eq("car")
  		expect(car.coolness_value).to eq(1)
  		expect(car.horsepower).to eq(1)
  		expect(car.torque).to eq(1)
  		expect(car.weight).to eq(1)
  	end

  	it "expects setup to alter default parameters of an already defaulted car" do
  		car.setup(year: 1999, 
  			make: "Ford", 
  			model: "Explorer", 
  			coolness_value: 1, 
  			horsepower: 160,
  			torque: 225,
  			weight: 3891 )
  		expect(car.year).to eq(1999)
  		expect(car.make).to eq("Ford")
  		expect(car.model).to eq("Explorer")
  		expect(car.coolness_value).to eq(1)
  		expect(car.horsepower).to eq(160)
  		expect(car.torque).to eq(225)
  		expect(car.weight).to eq(3891)
  	end

    it "can calculate power to weight ratios for itself" do
      car.setup(year: 1999, 
        make: "Ford", 
        model: "Explorer", 
        coolness_value: 1, 
        horsepower: 160,
        torque: 225,
        weight: 3891 )
      expect(car.calculate_power_to_weight_ratio).to eq(0.0411)
    end
  end
end
