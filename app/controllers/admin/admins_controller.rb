class Admin::AdminsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_admin!

  def after_sign_in_path_for(resource)
    admin_hackers_path
  end
end
