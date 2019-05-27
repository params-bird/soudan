class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index, :show]

  def index
    @chat_rooms = ChatRoom.where(topic_id: params[:topic_id]).includes(messages: :user).includes(:user_chat_rooms)
  end


  def show
    if Message.where(chat_room_id: params[:id]).where(receive_user_id: current_user.id).present?
      @room_message = Message.where(chat_room_id: params[:id]).where(receive_user_id: current_user.id)
      @room_message.update(receive_user_id_checked_message: current_user.id)
    end
    @chat_room = ChatRoom.find(params[:id])
    @chat_room_id = UserChatRoom.where(user_id:params[:id]).pluck(:chat_room_id)
    if UserChatRoom.where(user_id: current_user.id, chat_room_id: @chat_room.id).present?
      @messages = @chat_room.messages.order(created_at: :desc)
      @message = Message.new
      @user_chat_rooms = @chat_room.user_chat_rooms
      # メッセージの受信者のidをUserChatRoomから自分以外で検索し代入。未読アテンション表示のための準備として
      @receive_user = UserChatRoom.where(chat_room_id: params[:id]).where('user_id != ?', current_user.id).first
    else
      redirect_back(fallback_location: root_path)
    end
  end


  def create
    @chat_room  = ChatRoom.create(topic_id: params[:topic_id], topic_create_user_id: params[:user_chat_room][:topic_create_user_id], sender_user_id: current_user.id)
    @user_chat_room1 = UserChatRoom.create(chat_room_id: @chat_room.id, user_id: @chat_room.topic.user.id)
    @user_chat_room2 = UserChatRoom.create(chat_room_id: @chat_room.id, user_id: @chat_room.sender_user_id)
    if @chat_room.save && @user_chat_room1.save && @user_chat_room2.save
    redirect_to topic_chat_room_path(topic_id: params[:topic_id], id: @chat_room.id)
    end

  end


  private

  def set_user
    @user = User.find(current_user.id)
  end

  def chat_room_in
    @another_entries = UserChatRoom.where(chat_room_id: my_room_ids).where('user_id != ?', current_user.id)
  end

end