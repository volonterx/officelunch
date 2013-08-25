# -*- encoding : utf-8 -*-
class MenusController < ApplicationController
  before_filter :get_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Menu.order(:date_init)
  end

  def show
    @courses = @menu.courses
  end

  def new
    @menu = Menu.new()
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path, notice: "Меню успешно создано"
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @menu.update_attributes(menu_params)
      redirect_to menus_path, notice: "Меню успешно обновлено"
    else
      render action: :edit
    end
  end

  def destroy
    if @menu.destroy
      notice = 'Меню успешно удалено'
    else
      notice = 'Меню не была удалено'
    end
    redirect_to menus_path, notice: notice
  end

  private

  def get_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit!
  end

end
