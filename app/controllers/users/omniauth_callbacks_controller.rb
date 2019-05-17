class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def line
    callback_for(:line)
  end


  def google_oauth2
    callback_for(:line)
  end


  def callback_for(provider)
    # authから情報を取る
    @omniauth = request.env['omniauth.auth']
    # authの情報が入っていたら
    if @omniauth.present?
      # userテーブルに登録があるか検索
      @user = User.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
      # ユーザー登録済みであればそのままログイン
      if @user
        bypass_sign_in(@user)
      else
        # ユーザー登録なければ新規にアカウント作成
        @user = User.create(omniauth_params)
        bypass_sign_in(@user)
        redirect_to user_mypage_path(@user.id) and return
      end
    else
      # authに情報がない場合は新規登録画面に遷移
      redirect_to new_user_registration_path and return
    end
  end







  # def google_oauth2
  #   @user = User.find_for_google(request.env['omniauth.auth'])
  #   if @user.persisted?
  #     flash[:notice] = I18n.t 'devise.omniauth_callbacks.success'
  #     bypass_sign_in(@user)
  #     redirect_to user_mypage_path(@user.id) and return
  #   else
  #     redirect_to user_mypage_path(@user.id) and return
  #   end
  # end


  # def line
  #   callback_for(:line)
  # end

  # private
  # def callback_for(provider)
  #   @omniauth = request.env['omniauth.auth']
  #   if @omniauth.present?
  #     @user = User.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
  #     if @user
  #       bypass_sign_in(@user)
  #     else
  #       @user = User.new(omniauth_params)
  #       @user = current_user || User.create!(provider: @omniauth['provider'], uid: @omniauth['uid'], name: @omniauth['info']['name'], avater: @omniauth['info']['image'], password: Devise.friendly_token[0, 20])
  #       bypass_sign_in(@user)
  #       redirect_to user_mypage_path(@user.id) and return
  #     end
  #   end
  #   redirect_to user_mypage_path(@user.id) and return
  # end


  protected
  def omniauth_params
    params.require(:user).permit(:provider, :uid, :email, :name, :avater, :password)
  end


end