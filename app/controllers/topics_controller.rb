class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create, :show, :edit, :update, :destroy, :search]
  before_action :set_form_data, only: [:new, :edit, :search]

  def index
    @topic = Topic.all.order(id: "DESC")
  end


  def show
    @topic = Topic.find(params[:id])
    @chat_room=ChatRoom.where(topic_id: @topic.id)
    @chat_room.each do |chat_room|
      if chat_room.topic_create_user_id.present?  && chat_room.sender_user_id == current_user.id   #ログインユーザーとtopic所有者のチャットルームがあるか確認
        @check_room = true  #すでにチャットルームがあるので、後のビュー画面切り替えのために@check_roomにtrueの文字を入れておく
        @room_id = chat_room.id  #ハッシュに入っているチャットルームidを取り出しビューに渡す（リンクアドレスに入れるため）
      end
    end
    if @check_room.present?         #値が入っていれば
    else    #値が入っていなければ（チャットルームがなければ）新しいチャットルームを作るためのインスタンスを作る。
      @chat_room = ChatRoom.new
      @user_chat_room = UserChatRoom.new
    end
  end


  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
      flash[:success] = "投稿が完了しました"
    else
      render :new
      flash[:danger] = "必須項目をすべて選択してください"
    end
  end

  def search
    @topics = Topic.where(category_id: params[:category_id]).limit(49).reverse_order
  end

  protected
  def set_form_data
    @category = Category.all
  end

  def set_user
    @user = User.find(current_user.id) if user_signed_in?
  end



  private
  def topic_params
    params.require(:topic).permit(:title, :category_id, :text).merge(user_id: current_user.id)
  end

end
