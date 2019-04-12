class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_form_data
  # before_action :authenticate_user!, only: [:set_user]

  protected
  def set_form_data
    @category = Category.all
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end

end