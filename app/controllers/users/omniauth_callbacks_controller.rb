class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def line
    @auth = request.env['omniauth.auth']
    if @auth.present?
      @user = User.where(provider: @auth['provider'], uid: @auth['uid']).first
      if @user
        bypass_sign_in(@user)
      else
        @user = User.new(provider: @auth['provider'], uid: @auth['uid'])
        email = @auth['info']['email'] ? @auth['info']['email'] : "#{@auth['uid']}-#{@auth['provider']}@example.com"
        @user = current_user || User.create!(
          provider: @auth['provider'],
          uid:      @auth['uid'],
          image:    ＠auth.info.image,
          email:     email,
          name:     @auth['info']['name'],
          avater:   remote_image_url,
          password: Devise.friendly_token[0, 20],
          @user.remote_avater_url = ＠auth['info']['image']
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
        @user = User.create(
          name:     @auth.info.name,
          email:    @auth.info.email,
          avater:   remote_image_url,
          provider: @auth.provider,
          uid:      @auth.uid,
          password: Devise.friendly_token[0, 20],
          @user.remote_avater_url = @auth.info.image
        )
        bypass_sign_in(@user)
        redirect_to user_mypage_path(@user.id) and return
      end
    else
      redirect_to new_user_registration_path and return
    end
  end


end