class UserChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index]

  def index
    if current_user.user_chat_rooms.blank?
      @no_rooms = "メッセージはありません"
    else
    @current_chat_rooms = current_user.user_chat_rooms.pluck(:chat_room_id) #pluckで指定したカラムのみ
    # Message.where(room_id: my_room_ids).pluck(:room_id)に対し配列で検索に渡したいので
    my_chat_room_ids = []
    my_chat_room_ids << @current_chat_rooms
    # 相談相手になるをクリックしてChatRoomが作られ中間テーブルのUserChatRoomsレコードも作られたがmessagesが空の場合UserChatRoomsに対しChatRoom_idを削除するための差分ChatRoom_id確認用
    @messages = Message.where(chat_room_id: my_chat_room_ids).pluck(:chat_room_id)   #pluckで指定したカラムのみ
    @messages = @messages.uniq                                        #変数内重複削除
    @nil_message_room_id = @current_chat_rooms - @messages               #２つの配列の差分確認のみ渡す
    UserChatRoom.where(chat_room_id: @nil_message_room_id).destroy_all            #UserChatRoomレコードの削除
    # 自分以外の反映
    @another_rooms = UserChatRoom.where(chat_room_id: my_chat_room_ids).where('user_id != ?', current_user.id).limit(30).order(updated_at: "ASC")
    end
  end

  def set_user
    @user = User.find(current_user.id) if user_signed_in?
  end

end