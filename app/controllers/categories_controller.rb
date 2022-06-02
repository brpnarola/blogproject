# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %w[show edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if  @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :user_id)
  end

  def set_category
    @category = Category.find_by(id: params[:id])
  end
end
