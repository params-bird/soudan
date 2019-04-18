module Common
  extend ActiveSupport::Concern

  included do
    # ここにcallback等
  end

  # メソッド
  def new_message_room
    # @user=User.find(params[:id])
    @current_user_entry=Entry.where(user_id: current_user.id)
    @user_entry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id    #ログイン中のユーザーとマイページ所有のユーザーが合致するか
    else
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id then   #ログインユーザーとマイページ所有者のチャットルームがあるか確認
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end
      if @is_room         #値が入っていれば（roomがすでにあれば）
      else    #値が入っていなければ（roomがなければ）新しいroomインスタンスを作る。
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  private

  # privateメソッド
