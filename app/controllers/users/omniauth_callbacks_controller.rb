class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def line
    basic_action
  end

  private
  def basic_action
    @omniauth = request.env['omniauth.auth']
    if @omniauth.present?
      @user = User.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
      if @user
        @user.set_values(@omniauth)
        bypass_sign_in(@user)
      else
        @user = User.new(provider: @omniauth['provider'], uid: @omniauth['uid'])
        email = @omniauth['info']['email'] ? @omniauth['info']['email'] : "#{@omniauth['uid']}-#{@omniauth['provider']}@example.com"
        @user = current_user || User.create!(provider: @omniauth['provider'], uid: @omniauth['uid'], email: email, name: @omniauth['info']['name'], avater: @omniauth['info']['image'], password: Devise.friendly_token[0, 20])
        # @user.set_values(@omniauth)
        bypass_sign_in(@user)
        redirect_to user_path(@user.id)
      end
    end
    redirect_to root_path, notice: 'ログインしました'
  end

  def fake_email(uid,provider)
      return "#{auth.uid}-#{auth.provider}@example.com"
  end

end