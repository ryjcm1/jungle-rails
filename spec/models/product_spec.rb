require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    # validation tests/examples here
    subject do
      category = Category.new
      product = category.products.new(
        name: "Harry Potter and the Philosopher's Stone",
        quantity: 12,
        price: 13.99
        )
    end 

    it ('should save properly with all four fields set') do
      subject.save
      expect(subject).to be_valid

    end

    it ('should not be created without a name') do
      subject.name = nil
      subject.save
      expect(subject.errors.full_messages).to include("Name can't be blank")

    end
    
    it('should not be created without a price') do
      subject.price_cents = nil
      subject.save
      expect(subject.errors.full_messages).to include("Price can't be blank")

    end

    it('should not be created without a quantity') do
      subject.quantity = nil
      subject.save
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end

    it ('should not be created without a category') do 
      subject.category = nil
      subject.save
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end 

  end

end
