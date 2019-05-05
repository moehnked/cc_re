require "rails_helper"

RSpec.describe "adding a car", type: :system do
  it "allows a user to create a car" do
    visit new_car_path
    fill_in "Year", with: "1999"
    fill_in "Make", with: "Ford"
    fill_in "Model", with: "Mustang"
    fill_in "Coolness value", with: 5
    fill_in "Horsepower", with: 260
    fill_in "Torque", with: 300
    fill_in "Weight", with: 3069
    click_on("Create Car")
    visit cars_path
    @car = Car.find_by(model: "Mustang")
    expect(page).to have_selector("#car_#{@car.id} .year", text: "1999")
    expect(page).to have_selector("#car_#{@car.id} .make", text: "Ford")
    expect(page).to have_selector("#car_#{@car.id} .model", text: "Mustang")
    expect(page).to have_selector("#car_#{@car.id} .coolness_value", text: "5")
    expect(page).to have_selector("#car_#{@car.id} .horsepower", text: "260")
    expect(page).to have_selector("#car_#{@car.id} .torque", text: "300")
    expect(page).to have_selector("#car_#{@car.id} .weight", text: "3069")
  end
end