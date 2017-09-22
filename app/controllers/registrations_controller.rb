class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:firstname, :lastname, :myself, :username, :email, :password, :password_confirmation,:avatar)
  end

  def sign_in_params
    params.require(:user).permit(:username, :password)
  end

  def account_update_params
    params.require(:user).permit(:firstname, :lastname, :myself,:username, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end