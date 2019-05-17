class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def line
    @auth = request.env['omniauth.auth']
    if @auth.present?
      @user = User.where(provider: @auth['provider'], uid: @auth['uid']).first
      if @user
        bypass_sign_in(@user)
      else
        @user = User.new
        @user.remote_avater_url = @auth.info.image
        email = @auth['info']['email'] ? @auth['info']['email'] : "#{@auth['uid']}-#{@auth['provider']}@example.com"
        @user = current_user || User.create!(
          provider: @auth['provider'],
          uid:      @auth['uid'],
          name:     @auth['info']['name'],
          email:     email,
          avater:   @user.remote_avater_url,
          password: Devise.friendly_token[0, 20],
        )
        bypass_sign_in(@user)
        redirect_to user_mypage_path(@user.id) and return
      end
    end
    redirect_to new_user_registration_path and return
  end

  def google_oauth2
    @auth = request.env["omniauth.auth"]
    if @auth.present?
      @user = User.find_by(email: @auth.info.email)
      if @user
        bypass_sign_in(@user)
      else
        @user = User.new
        @user.remote_avater_url = @auth.info.image
        @user = User.create(
          provider: @auth.provider,
          uid:      @auth.uid,
          name:     @auth.info.name,
          email:    @auth.info.email,
          avater:   @user.remote_avater_url,
          password: Devise.friendly_token[0, 20],
        )
        bypass_sign_in(@user)
        redirect_to user_mypage_path(@user.id) and return
      end
    else
      redirect_to new_user_registration_path and return
    end
  end

  private
  def oauth_params
    params.require(:user).permit(:provider, :uid, :image, :email, :name, :avater, :password)
  end

end