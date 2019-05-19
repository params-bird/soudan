class BadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message

  def create
    Bad.create(user_id: params[:user_id], message_id: params[:message_id])
    render 'create.js.erb'
  end

  def destroy
    bad = Bad.find(params[:id])
    bad.destroy
    render 'destroy.js.erb'
  end

  private
  def set_message
    @message = Message.find(params[:message_id])
  end

end