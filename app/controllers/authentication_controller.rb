class AuthenticationController < ApplicationController

	before_action :autorize_request, except: :login

	def login
		@user = User.find_by_email(login_params[:email])
		if @user&.authenticate(login_params[:password])
			token = JsonWebToken.encode(user_id: @user.id)
			time = Time.now + 24.hours.to_i
			render json: { token: token, expiration: time.strftime("%m-%d-%Y %H:%M"), username: @user.username }, status: :ok
		else
			render json: {error: 'unauthorized'}, status: :unauthorized
		end
	end

	private

	def login_params
		params.permit(:email, :password)
	end

end
