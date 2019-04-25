module ApplicationHelper

  def resource_name
    :user
  end

  def resource
      @resource ||= User.new
  end

  def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
  end

  def header_title
    if params[:controller] == 'user_chat_rooms'
      "受信箱"
    elsif params[:controller] == 'chat_rooms' && params[:action] == 'index'
      "TOPICタイトルの返信一覧"
    elsif params[:controller] == 'chat_rooms' && params[:action] == 'room'
      "hogehogeさんとのチャット"
    elsif params[:controller] == 'topics' && params[:action] == 'index'
      "新着一覧"
    elsif params[:controller] == 'topics' && params[:action] == 'new'
      "相談投稿"
    elsif params[:controller] == 'users/registrations' && params[:action] == 'new'
      "新規登録"
    elsif params[:controller] == 'users/sessions' && params[:action] == 'new'
      "ログイン"


    end
  end
end
