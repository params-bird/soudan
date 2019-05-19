class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def line
    @auth = request.env['omniauth.auth']
    # ユーザーはすでにサービスに登録しているか検索
    @user = User.where(provider: @auth[:provider], uid: @auth[:uid]).first
    if @user
      # 既にサービスに登録していればログイン処理
      bypass_sign_in(@user)
    else
      # サービスに登録していなければSNS情報を基に新規に登録
      # LINEユーザーはmailアドレス持っておらずnull制約で登録できなくなるのでフェイクアドレスを作る
      email = @auth[:info][:email] ? @auth[:info][:email] : "Dummy-#{@auth[:provider]}@example.com"
      # 下記のよりcreateメソッド
      @user = current_user || User.create!(
        provider: @auth[:provider],
        uid:      @auth[:uid],
        remote_image_url: @auth[:info][:image],
        name:     @auth[:info][:name],
        email:     email,
        password: Devise.friendly_token[0, 20],
      )
      if @user.persisted?
        # 新たにレコードが作られたか
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'LINE'
        bypass_sign_in(@user)
        # ログインさせマイページに遷移
        redirect_to user_mypage_path(@user.id) and return
      else
        # 失敗の際はアカウン登録画面に遷移
        session['devise.line_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow   some session stores
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
    end
  end


  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      bypass_sign_in(@user)
      redirect_to user_mypage_path(@user.id)
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

end