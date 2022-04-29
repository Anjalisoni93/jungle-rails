require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'Should validate if all fields are set' do
      @category = Category.new({:name => "Test"})
      @product = Product.new({:name => "Test", :price => 1000, :quantity => 1, :category => @category})
      expect(@product).to be_valid
    end

    it 'Should not validate when name is set to nil' do
      @category = Category.new({:name => "Test"})
      @product = Product.new({:name => nil, :price => 1000, :quantity => 1, :category => @category})
      expect(@product).to_not be_valid
    end

    it 'should have an error message with name cant be blank' do
      @category = Category.new({:name => 'Test'})
      @product = Product.create(name: nil, price: 1000, quantity: 2, category: @category)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not validate when price is set to nil' do
      @category = Category.new({:name => 'Test'})
      @product = Product.new({:name => "Test", :price => nil, :quantity => 1, :category => @category})
      expect(@product).to_not be_valid
    end

    it 'should not validate when quantity is set to nil' do
      @category = Category.new({:name => 'Test'})
      @product = Product.new({:name => "Test", :price => 1000, :quantity => nil, :category => @category})
      expect(@product).to_not be_valid
    end

    it 'should not validate when category is set to nil' do
      @product = Product.new({:name => "Test", :price => 1000, :quantity => 1, :category => nil})
      expect(@product).to_not be_valid
    end
  end
end
