class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#  before_action :authenticate_user!
    def authenticate_admin!
      unless current_user.is_admin
        flash[:error] = "You must be an admin to acces this page"
        redirect_to root_path
      end
    end
    def authenticate_auctioneer!
      unless current_user.is_auctioneer || current_user.is_admin
        flash[:error] = "You must be an auctioneer to acces this page"
        redirect_to root_path
      end
    end
end
