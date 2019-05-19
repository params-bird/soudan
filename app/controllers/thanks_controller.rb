class ThanksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message

  def create
    @thank = Thank.create(user_id: params[:user_id], message_id: params[:message_id])
    @thanks = Thank.where(message_id: params[:message_id])
    @message.reload
  end

  def destroy
    thank = Thank.find_by(message_id: params[:message_id])
    thank.destroy
    @thanks = Thank.where(message_id: params[:message_id])
    @message.reload
  end

  private
  def set_message
    @message = Message.find(params[:message_id])
  end

end













  # def create
  #   Thank.create(user_id: params[:user_id], message_id: params[:message_id])
  #   # redirect_back(fallback_location: root_path)
  # end

  # def destroy
  #   thank = Thank.find_by(user_id: params[:user_id], message_id: params[:message_id])
  #   thank.destroy
  #   # redirect_back(fallback_location: root_path)
  # end

  # def set_variables
  #   @id_name = "#thank-link-#{params[:message_id]}"
  #   # @message = Message.find(params[:message_id])
  # end




  # def create
  #   @message = Message.find(params[:message_id])
  #   @message.thank(current_user)
  # end

  # def destroy
  #   @message = Message.find(params[:id]).message
  #   @message.unthank(current_user)
  # end
