class BadsController < ApplicationController

  def create
    Bad.create(user_id: params[:user_id], message_id: params[:message_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @bad = Bad.find_by(user_id: params[:user_id], message_id: params[:message_id])
    @bad.destroy
    redirect_back(fallback_location: root_path)
  end

end
