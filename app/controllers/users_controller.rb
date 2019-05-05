class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy, :user_topics, :mypage]
  before_action :set_user, only: [:show, :update, :destroy, :user_topics, :mypage]

  def mypage
  end

  def index
    @user = User.new
    @users = User.all
  end

  def user_topics
    if Topic.where(user_id: current_user.id).present?
      @topic = Topic.where(user_id: current_user.id).order(id: "DESC")
    else
      @no_topics = "投稿はありません"
    end
  end

  private
    def set_user
      if current_user.id == params[:id]
        @user = User.find(params[:id])
      else
        redirect_to new_user_session_path
      end
    end

end
