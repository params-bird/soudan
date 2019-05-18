class ThanksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variables

  def create
    Thank.create(user_id: params[:user_id], message_id: params[:message_id])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @thank = Thank.find_by(user_id: params[:user_id], message_id: params[:message_id])
    @thank.destroy
    # redirect_back(fallback_location: root_path)
  end

  def set_variables
    @message = Message.find(params[:message_id])
    @id_name = "#thank-link-#{@message.id}"

  end
end
