class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:alluser]
  def show
  end
  def alluser
    if params[:search]
      @users = User.search(params[:search]).order(:lastname, :name)
    else
      @users = User.all.order(:lastname, :name)
    end
  end
  def show_user
    @user = User.find(params[:id])
  end
  private
    def admin_user
      if user_signed_in?
        redirect_to '/denial' unless current_user.has_role? :admin
      else
        redirect_to '/denial'
      end
    end
end
