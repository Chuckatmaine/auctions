class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#  before_action :authenticate_user!
    def authenticate_admin!
      unless current_user.is_admin
        redirect_to root_path, alert: "You must be an admin to acces that page"
      end
    end
    def authenticate_auctioneer!
      unless current_user.is_auctioneer || current_user.is_admin
        redirect_to root_path, alert: "You must be an auctioneer to acces that page"
      end
    end
end
