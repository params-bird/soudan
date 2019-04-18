class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_form_data
  protected
  def set_form_data
    @category = Category.all
  end
end