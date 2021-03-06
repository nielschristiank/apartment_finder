class ApartmentsController < ApplicationController
  #before_action :authenicate_user!, only: [:create, :destroy, :show_by_user]

  def index
    apartments = Apartment.all
    render json: apartments
  end

  def create
    apartment = Apartment.create(apartment_params)
      # repsond with new apartment
    if apartment.valid? # check is apartment exists
      render json: apartment
    else
      render json: apartment.errors, status: :unprocessable_entity
    end
  end

  def show
    apartment = Apartment.find_by(id:params[:id])
    render json: apartment
  end

  def show_by_user
    #user = User.find()
    apartments = Apartment.where(user_id:params[:user_id])
    p apartments
    render json: apartments
  end

  def update
    apartment = Apartment.find_by(id:params[:id])
    apartment.update(apartment_params)
    render json: apartment
  end

  def destroy
    apartment = Apartment.find_by(id:params[:id])
    apartment.destroy
  end

  def apartment_params
    params.require(:apartment).permit(:user_id, :address_1, :address_2, :city, :postal_code, :state, :country, :building_manager_name, :building_manager_phone, :building_manager_hours)
  end


end
