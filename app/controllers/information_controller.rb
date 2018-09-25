class InformationController < ApplicationController

  def show_user
    user = User.where(id:params[:id])
    render json: user
  end

end
