class Admin::DashboardController < Devise::AdminController
  before_action :authenticate_admin!
  
end
