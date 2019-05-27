class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :message_params, only:[:create]

  def create
    @message = Message.new(message_params)
    if @message.save
    redirect_back(fallback_location: root_path)
    flash[:success] = "メッセージを送信しました"
    # redirect_to topic_chat_room_path(topic_id: @message.chat_room.topic_id, id: params[:message][:chat_room_id])  #メッセージを送るをクリック後にチャットスペースに遷移する
    else
      redirect_back(fallback_location: root_path)
      # redirect_to topic_chat_room_path(topic_id: @message.chat_room.topic_id, id: params[:message][:chat_room_id])
      flash[:alert] = "メッセージを入力してください"
    end

  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_room_id, :receive_user_id).merge(user_id: current_user.id)
  end


end
