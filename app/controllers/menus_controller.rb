# -*- encoding : utf-8 -*-
class MenusController < ApplicationController
  before_filter :get_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Menu.order('date_init DESC')
  end

  def show
    @courses = @menu.courses
  end

  def new
    @menu = Menu.new({date_init: Date.today.strftime("%d-%m-%Y")})
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

  def send_email_about_dinner
    email_digest = DeliverEmailsAboutDinnerService.new(params[:id])
    email_digest.delay.send_email_and_update_menu_status
    redirect_to menus_path, notice: I18n.t('front.menus.digest_was_launched')
  end

  private

  def get_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit!
  end

end
