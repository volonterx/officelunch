# -*- encoding : utf-8 -*-
class CoursesController < ApplicationController

    before_filter :get_course, only: [:edit, :update, :destroy]
    before_filter :get_categories, only: [:new, :create, :edit, :update]

    def index
      @courses = Course.order(:category_id)
    end

    def new
      @course = Course.new()
    end

    def create
      @course = Course.new(course_params)
      if @course.save
        redirect_to courses_path, notice: "Категория успешно созадна"
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @course.update_attributes(course_params)
        redirect_to courses_path, notice: "Категория успешно обновлена"
      else
        render action: :edit
      end
    end

    def destroy
      if @course.destroy
        notice = 'Категория успешно удалена'
      else
        notice = 'Категория не была удалена'
      end
      redirect_to courses_path, notice: notice
    end

    private

    def get_course
      @course = Course.find(params[:id])
    end

    def get_categories
      @course_categories = CourseCategory.all
    end

    def course_params
      params.require(:course).permit!
    end

end
