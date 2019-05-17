class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @auth = request.env["omniauth.auth"]
    if @auth.present?
      @user = User.find_by(email: @auth.info.email)
      if @user
        bypass_sign_in(@user)
      else
        user = User.create(
          name:     auth.info.name,
          email:    auth.info.email,
          provider: auth.provider,
          uid:      auth.uid,
          password: Devise.friendly_token[0, 20],
        )
      end
    else
      redirect_to new_user_registration_path and return
    end
  end


  def line
    basic_action
  end

  private
  def basic_action
    @omniauth = request.env['omniauth.auth']
    if @omniauth.present?
      @user = User.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
      if @user
        bypass_sign_in(@user)
      else
        @user = User.new(provider: @omniauth['provider'], uid: @omniauth['uid'])
        email = @omniauth['info']['email'] ? @omniauth['info']['email'] : "#{@omniauth['uid']}-#{@omniauth['provider']}@example.com"
        @user = current_user || User.create!(provider: @omniauth['provider'], uid: @omniauth['uid'], name: @omniauth['info']['name'], avater: @omniauth['info']['image'], password: Devise.friendly_token[0, 20])
        bypass_sign_in(@user)
        redirect_to user_mypage_path(@user.id) and return
      end
    end
    redirect_to new_user_registration_path and return
  end

end