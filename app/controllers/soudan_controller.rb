class SoudanController < ApplicationController
  before_action :set_user, only: [:index]

  def test
  end


  private
    def set_user
      if user_signed_in?
        @user = User.find(current_user.id)
      else
        root_path
      end
    end
end
