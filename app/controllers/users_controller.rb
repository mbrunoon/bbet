class UsersController < ApplicationController

	before_action :authorize_request
	before_action :find_user

	def show
		render json: @user, status: :ok
	end
	
	private

	def find_user
		begin
			@user = User.find_by_username!(params[:_username])
		rescue 
			render json: { errors: 'User not found' }, status: :not_found
		end
	end

end
