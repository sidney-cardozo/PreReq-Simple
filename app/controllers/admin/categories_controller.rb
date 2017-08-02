class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.order(name: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
    @category.save
  end
end

# def index
#     @products = Product.order(id: :desc).all
#   end

#   def new
#     @product = Product.new
#   end

#   def create
#     @product = Product.new(product_params)

#     if @product.save
#       redirect_to [:admin, :products], notice: 'Product created!'
#     else
#       render :new
#     end
#   end

#   def destroy
#     @product = Product.find params[:id]
#     @product.destroy
#     redirect_to [:admin, :products], notice: 'Product deleted!'
#   end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

