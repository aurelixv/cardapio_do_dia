# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :telephone, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :telephone, :email, :password, :password_confirmation)
  end
end
