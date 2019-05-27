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
    case params.values_at :controller, :action
    when ['user_chat_rooms', 'index']
      "メッセージ一覧"
    when ['chat_rooms', 'show']
      "メッセージルーム"
    when ['topics', 'index']
      "投稿一覧"
    when ['topics', 'new']
      "相談"
    when ['users/registrations', 'new']
      "新規登録"
    when ['users/sessions', 'index']
      "ログイン"
    when ['users', 'user_topics']
      "ユーザー投稿一覧"
    when ['soudan', 'kiyaku']
      "利用規約"
    when ['soudan', 'privacy_policy']
      "プライバシーポリシー"
    else

    end
  end

# 　未読メッセージ表示のメソッド
  def new_message_badge
    receive_user = Message.where(receive_user_id: current_user.id).count
    receive_user_checked_message = Message.where(receive_user_id_checked_message: current_user.id).count
    message_count = receive_user - receive_user_checked_message
    if 0 == message_count
    else
      # 未読メッセージがある際にdiv要素を吐き出させてハンバーガーメニュー内に配置する。
      # 未読メッセージが無い際に未読バッジを表示させないため
      content_tag(:div, message_count, class: 'new-message-badge')
    end
  end


  # デバイスのエラーメッセージ出力メソッド
  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="devise_error_messages" role="alert">
          <p class="error_msg">・#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end

end