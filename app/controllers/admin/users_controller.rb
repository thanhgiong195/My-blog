class Admin::UsersController < ApplicationController
  before_action :check, only: :index
  load_and_authorize_resource

  def index
    @users = User.order(:name).page(params[:page]).per_page 30
    respond_to do |format|
      format.html {@users = User.all}
      format.csv { send_data @users.to_csv }
      format.xls { render text: @users.to_csv(col_sep: "\t") }
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".delete_success"
      redirect_to admin_root_path
    else
      flash[:danger] = t ".delete_error"
      redirect_to fallback_location: admin_root_path
    end
  end
end
