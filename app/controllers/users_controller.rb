# -*- encoding : utf-8 -*-
class UsersController < InheritedResources::Base
  actions :index, :edit, :destroy

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: t('front.users.success_update')
    else
      render action: :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
