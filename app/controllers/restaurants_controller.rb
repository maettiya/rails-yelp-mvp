class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
    redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # def update
  #   @restaurant = Restaurant.find(params[:id])
  #   @restaurant.update(restaurant_params)
  #   redirect_to restaurant_path(@restaurant)
  # end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

#   def seed
#   require "faker"

#   Review.destroy_all
#   Restaurant.destroy_all

#   10.times do
#     restaurant = Restaurant.create!(
#       name: Faker::Restaurant.name,
#       address: Faker::Address.full_address,
#       phone_number: Faker::PhoneNumber.phone_number_with_country_code,
#       category: Restaurant::CATEGORY.sample
#     )

#     rand(2..5).times do
#       Review.create!(
#         content: Faker::Restaurant.review,
#         rating: rand(1..5),
#         restaurant: restaurant
#       )
#     end
#   end

#   redirect_to restaurants_path, notice: "Database seeded successfully!"
# end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
