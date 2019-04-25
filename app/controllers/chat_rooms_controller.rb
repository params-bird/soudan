class ChatRoomsController < ApplicationController
  class RoomsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :index]
    # before_action :set_users, only: []


    def room
    end


    def index
      @current_entries = current_user.entries.pluck(:room_id) #pluckで指定したカラムのみ
      # Message.where(room_id: my_room_ids).pluck(:room_id)に対し配列で検索に渡したいので
      my_room_ids = []
      my_room_ids << @current_entries
      # メッセージを送るをクリックしてroomが作られ中間テーブルのentriesレコードも作られたがmessagesが空の場合entiresに対しroom_idを削除するための差分room_id確認用
      @messages = Message.where(room_id: my_room_ids).pluck(:room_id)   #pluckで指定したカラムのみ
      @messages = @messages.uniq                                        #変数内重複削除
      @nil_message_room_id = @current_entries - @messages               #２つの配列の差分確認のみ渡す
      Entry.where(room_id: @nil_message_room_id).destroy_all            #entryレコードの削除
      # 自分以外の反映
      @another_entries = Entry.where(room_id: my_room_ids).where('user_id != ?', current_user.id)

    end

    def create
      #メッセージを送るをクリックした際にチャットルームと中間テーブルを作成する。
      @room = Room.create(room_created_user_id: current_user.id, reception_user_id: params[:entry][:user_id])
      @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
      @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
      redirect_to user_room_path(user_id: current_user.id, id: @room.id)   #メッセージを送るをクリック後にチャットスペースに遷移する
    end

    def show
      @room = Room.find(params[:id])
      @room_user = Entry.where(room_id: params[:id]).where('user_id != ?', current_user.id)
      @room_user.each do |user|
      @reception_user = User.find(user.user_id)
      end
      #チャットへのボタンを押した際にどのroom_idかを渡すためにログインユーザーと送りたいユーザーの両条件に合致したroom_idを探す。
      @room_id = Entry.where(user_id:params[:id], user_id:current_user.id).pluck(:room_id)
      if Entry.where(user_id: current_user.id, room_id: @room.id).present?
        @messages = @room.messages.order(created_at: :desc)
        @message = Message.new
        @entries = @room.entries
      else
        redirect_back(fallback_location: root_path)
      end
    end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def set_users
    @users = User.find(params[:id])
  end


    def chat_room_in
      @another_entries = Entry.where(room_id: my_room_ids).where('user_id != ?', current_user.id)
    end


  end

end
