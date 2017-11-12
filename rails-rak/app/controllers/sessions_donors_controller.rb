# class SessionsDonorsController <ApplicationController

#   include SessionsHelper

#   def create
#     if request.fullpath.include? "donor"
#       @donor = Donor.find_by(email: session_params[:email].d`owncase)
#       if @donor && @donor.authenticate(session_params[:password])
#           session[:id] = @donor.id
#           render json: @donor
#       else
#         # might need to create a custom error message for mismatch between pw and confirm pw
#         render json: {error: 'Wrong email or password'}
#       end
#   end


#   def destory
#     session[:id] = nil
#   end

#   private
#   def login_donor

#   def session_params
#     params.permit(:email, :password, :password_confirmation)
#   end

# end