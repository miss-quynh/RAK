class SessionsDonorsController <
  ApplicationController

  def create
    @donor = Donor.find_by_email(session_params[:email])
    if @donor && @d


  end

  def new
  end

  def logout
  end

  private

  def session_params
  end

end