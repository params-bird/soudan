class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_form_data
    @category = Category.all
  end

end