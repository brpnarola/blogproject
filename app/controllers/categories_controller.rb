# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %w[show edit delete update]

  ## list all categories
  def index
    @categories = Category.all
  end

  ## new category
  def new
    @category = Category.new
  end

  ## get category
  def show
  end

  ## edit category
  def edit
  end

  ## create category
  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  ## update category
  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  ## delete category
  def destroy
    @category.destroy
    redirect_to categories_path
  end


  protected
  def category_params
    params.require(:category).permit(:title, :user_id)
  end

  def set_category
    @category = Category.find_by(id: params[:id])
  end
end
