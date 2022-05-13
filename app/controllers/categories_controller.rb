# frozen_string_literal: true

class CategoriesController < ApplicationController
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
    @category = Category.find_by(id: params[:id])
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.update(category_params)
    @category.save
    redirect_to categories_path
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    redirect_to categories_path
  end

  protected

  def category_params
    params.require(:category).permit(:title, :user_id)
  end
end
