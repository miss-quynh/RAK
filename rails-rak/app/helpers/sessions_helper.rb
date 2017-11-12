module SessionsHelper

  def current_donor
    @current_donor ||= Donor.find(session[:id]) if session[:id]
  end

  def donor_logged_in?
    !!current_donor
  end

 end