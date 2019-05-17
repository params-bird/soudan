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
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"])

     if @user.persisted?
       flash[:notice] = I18n.t "devise.omniauth_callbacks.success",
                               :kind => "Google"
       sign_in_and_redirect @user, :event => :authentication
     else
       session["devise.google_data"] = request.env["omniauth.auth"]
       redirect_to new_user_registration_url
     end
   end

  private
  def oauth_params
    params.require(:user).permit(:provider, :uid, :image, :email, :name, :image, :password)
  end

end