class RegistrationsController < Devise::RegistrationsController
  def create
    super
      if resource.save
        UserMailer.welcome(resource).deliver
      end
  end
   
  private
 
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :street, :city, :state, :zip, :phone, :admin, :auctioneer, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end

