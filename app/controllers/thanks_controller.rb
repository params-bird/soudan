class ThanksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message

  def create
    Thank.create(user_id: params[:user_id], message_id: params[:message_id])
    render 'create.js.erb'
  end

  def destroy
    thank = Thank.find(params[:id])
    thank.destroy
    render 'destroy.js.erb'
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
