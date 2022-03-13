require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject do
      described_class.new(first_name: 'Bob', last_name: 'Dylan', email: 'maggiesfarm@nomore.com', password: 'biabhs', password_confirmation: 'biabhs')
    end

    it 'should be valid if user has a name, email, password, and password confirmation' do
      expect(subject).to be_valid
    end

    it 'should be invalid if no password is provided' do
      subject.password = nil
      expect(subject).to be_invalid

    end

    it 'should be invalid if no password confirmation is provided' do
      subject.password_confirmation = nil
      expect(subject).to be_invalid

    end

    it 'should be invalid if password confirmation does not match' do
      subject.password_confirmation = 'biabsss'
      expect(subject).to be_invalid
    end
    it 'should be invalid if no first name is provided' do
      subject.first_name = nil
      expect(subject).to be_invalid
    end
    it 'should be invalid if no last name is provided' do
      subject.last_name = nil
      expect(subject).to be_invalid
    end

    it 'should be invalid if email already exists' do
      subject.save

      already_exists = User.new(first_name: 'Bobby', last_name: 'Dylaney', email: 'MaggiesFARM@nomore.COM', password: 'biabhs', password_confirmation: 'biabhs')
      expect(already_exists).to be_invalid
    end

    it 'should be invalid if password is less than 6 characters in length' do
      subject.password = "biabh"
      subject.password_confirmation = "biabh"
      expect(subject).to be_invalid
    end

  end
end
