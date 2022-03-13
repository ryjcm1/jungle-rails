require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    # validation tests/examples here

    it ('should save properly with all four fields set') do
      @category = Category.new
      @product = @category.products.new
      @product.name = "Harry Potter and the Philosopher's Stone"
      @product.quantity = 12
      @product.price = 13.99
      @product.save
      expect(@product).to be_valid

    end

    it ('should not be created without a name') do
      @category = Category.new
      @product = @category.products.new
      @product.name = nil
      @product.quantity = 12
      @product.price = 13.99
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")

    end
    
    it('should not be created without a price') do
      @category = Category.new
      @product = @category.products.new
      @product.name = "Harry Potter and the Philosopher's Stone"
      @product.quantity = 12
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")

    end

    it('should not be created without a quantity') do
      @category = Category.new
      @product = @category.products.new
      @product.name = "Harry Potter and the Philosopher's Stone"
      @product.quantity = nil
      @product.price = 13.99
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it ('should not be created without a category') do 
      @category = Category.new
      @product = @category.products.new
      @product.name = "Harry Potter and the Philosopher's Stone"
      @product.quantity = 24
      @product.price = 13.99
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end 

  end

end
