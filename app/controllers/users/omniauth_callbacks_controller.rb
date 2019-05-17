class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def google_oauth2
    @user = User.find_for_google(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      bypass_sign_in(@user)
      redirect_to user_mypage_path(@user.id) and return
    else
      redirect_to user_mypage_path(@user.id) and return
    end
  end


  def line
    callback_for(:line)
  end

  private
  def callback_for(provider)
    @omniauth = request.env['omniauth.auth']
    if @omniauth.present?
      @user = User.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
      if @user
        bypass_sign_in(@user)
      else
        @user = User.new(omniauth_params)
        email = @omniauth['info']['email'] ? @omniauth['info']['email'] : "#{@omniauth['uid']}-#{@omniauth['provider']}@example.com"
        @user = current_user || User.create!(provider: @omniauth['provider'], uid: @omniauth['uid'], email: email, name: @omniauth['info']['name'], avater: @omniauth['info']['image'], password: Devise.friendly_token[0, 20])
        bypass_sign_in(@user)
        redirect_to user_mypage_path(@user.id) and return
      end
    end
    redirect_to user_mypage_path(@user.id) and return
  end


  def fake_email(uid,provider)
      return "#{auth.uid}-#{auth.provider}@example.com"
  end


  protected
  def omniauth_params
    params.require(:user).permit(:provider, :uid, :email, :name, :avater, :password)
  end


end