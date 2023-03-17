class PasswordResetsController < ApplicationController
	def new;end

	def edit
		@user.find_signed!(params[:token], purpose: "password_reset")
		rescue ActiveSupport::MessageVerifier::InvalidSignature
			redirect_to sign_in_path, alert: "Your token has expired."
	end

	def update
		if @user.update(password_params)
			redirect_to sign_in_path,
						notice: "Your password was reset successfully. Please sign in again."
		else
			render :edit
		end
	end

	private
		def password_params
			params.require(:user).permit(:password, :password_confirmation)
		end
end