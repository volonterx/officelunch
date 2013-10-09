# -*- encoding : utf-8 -*-
class OrdersController < InheritedResources::Base
  actions :all
  before_filter :get_menu, only: [:new, :edit, :update, :create]
  before_filter :order_params, only: [:create, :update]
  

  def create
    create! do |success, failure|
      success.html {redirect_to dashboard_index_path, notice: t('front.dashboard.success_create')}
    end
  end

  def update
    update! do |success, failure|
      success.html {redirect_to dashboard_index_path, notice: t('front.dashboard.success_update')}
    end
  end

  private

  def get_menu
    @today_menu = Menu.today
  end

  def order_params
    params[:order] = params.require(:order).permit!
    params[:order][:course_ids] = [] if params[:order][:not_order] == '1'
    params[:order][:sum] = Course.where(id: params[:order][:course_ids]).sum(:price)
  end

end
