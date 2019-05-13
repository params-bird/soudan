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


  def star_rate
    case
    when @user.thanks.count < 1
      "0%"
    when @user.thanks.count < 5
      "5%"
    when @user.thanks.count < 10
      "10%"
    when @user.thanks.count < 20
      "20%"
    when @user.thanks.count < 30
      "30%"
    when @user.thanks.count < 40
      "40%"
    when @user.thanks.count < 50
      "50%"
    when @user.thanks.count < 60
      "60%"
    when @user.thanks.count < 70
      "70%"
    when @user.thanks.count < 80
      "80%"
    when @user.thanks.count < 90
      "90%"
    when @user.thanks.count < 100
      "100%"
    end
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