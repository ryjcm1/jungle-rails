class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def show
    @number_of_categories = Category.count
    @number_of_products = Product.count

    puts @number_of_categories.inspect
  end
end
