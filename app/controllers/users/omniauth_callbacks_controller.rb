class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


  def line
    @auth = request.env['omniauth.auth']
    if @auth.present?
      @user = User.where(provider: @auth[:provider], uid: @auth[:uid]).first
      if @user
        bypass_sign_in(@user)
      else
        email = @auth[:info][:email] ? @auth[:info][:email] : "#{@auth[:uid]}-#{@auth[:provider]}@example.com"
        @user = current_user || User.create!(
          provider: @auth[:provider],
          uid:      @auth[:uid],
          remote_image_url: @auth[:info][:image],
          name:     @auth[:info][:name],
          email:     email,
          password: Devise.friendly_token[0, 20],
        )
        bypass_sign_in(@user)
        redirect_to user_mypage_path(@user.id) and return
      end
    end
    redirect_to new_user_registration_path and return
  end


  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      bypass_sign_in(@user)
      redirect_to user_mypage_path(@user.id)
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

end