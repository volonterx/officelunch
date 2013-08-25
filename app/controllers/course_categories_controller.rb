# -*- encoding : utf-8 -*-
class CourseCategoriesController < ApplicationController

  before_filter :get_category, only: [:edit, :update, :destroy]

  def index
    @categories = CourseCategory.all
  end

  def new
    @category = CourseCategory.new()
  end

  def create
    @category = CourseCategory.new(category_params)
    if @category.save
      redirect_to course_categories_path, notice: "Категория успешно созадна"
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to course_categories_path, notice: "Категория успешно обновлена"
    else
      render action: :edit
    end
  end

  def destroy
    if @category.destroy
      notice = 'Категория успешно удалена'
    else
      notice = 'Категория не была удалена'
    end
    redirect_to course_categories_path, notice: notice
  end
  
  private

  def get_category
    @category = CourseCategory.find(params[:id])
  end

  def category_params
    params.require(:course_category).permit!
  end

end
