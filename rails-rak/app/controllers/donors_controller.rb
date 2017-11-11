class DonorController < ApplicationController

  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      render json: @donor
    else
      @errors = @donor.errors.full_messages
      render json: {errors: @errors}, status: 406
  end

  def show
    @donor = Donor.find(params[:id])
    @followings = @donor.followings
    render json: {donor: @donor, followings: @followings}
  end

  def update
    @donor = Donor.find(params[:id])
    @donor.update(donor_params)
    render json: @donor
  end

  def delete
    @donor = Donor.find(params[:id])
    @donor.destroy
    render status: 200
  end

  private

  def donor_params
     params.require(:donor).permit(:first_name, :last_name, :email :street_address, :city, :state, :zip_code, :password)
  end

end