require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'furniture')
    end

    it "is valid if it has all attributes" do
      @product = Product.new(name: 'chair', price: 50, quantity: 2, category: @category)
      expect(@product.valid?).to be true
    end

    it 'should not be valid if it doesnt have a name' do
      @product = Product.new(price: 50, quantity: 2, category: @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")

    end

    it 'should not be valid if it doesnt have quantity specified' do
      @product = Product.new(name: "chair", price: 50, category: @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")

    end

    it 'should not be valid if it doesnt have a price' do
      @product = Product.new(name: "chair", quantity: 2, category: @category)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Price can't be blank")

    end

    it 'should not be valid if it doesnt have a category' do
      @product = Product.new(name: "chair", price: 50, quantity: 2)
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
