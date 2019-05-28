class ThanksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variables

  def create
    Thank.create(user_id: params[:user_id], message_id: params[:message_id])
    render 'thank_ajax.js.erb'
  end

  def destroy
    thank = Thank.find(params[:id])
    thank.destroy
    render 'thank_ajax.js.erb'
  end

  private
  def set_variables
    @message = Message.find(params[:message_id])
    @id_name = "#thanks-btn-#{@message.id}"
  end

end