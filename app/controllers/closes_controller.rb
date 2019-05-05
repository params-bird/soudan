class ClosesController < ApplicationController
  before_action :authenticate_user!

  def create
    @close = Close.create(topic_id: params[:topic_id])
    redirect_to user_topics_path(id: current_user.id)
  end


end
