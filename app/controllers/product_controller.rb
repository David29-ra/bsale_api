class ProductController < ApplicationController
  def index
    products_by_category = Category.all.map do |category|
      results = Product.all.filter { |p| p.category == category.id }
      { id: category.id, name: category.name, products: results }
    end

    render json: products_by_category
  end
end
