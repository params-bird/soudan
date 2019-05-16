class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def line
    basic_action
  end



  def callback_for(provider)
    oauth = request.env["omniauth.auth"]

    if User.where(email: oauth[:info][:email]).blank?
      @user = User.create_oauth(request.env["omniauth.auth"])
      if @user.persisted?
        bypass_sign_in(@user)
        redirect_to new_profile_path
        set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
      else
        session["devise.#{provider}_data"] = oauth.except("extra")
        redirect_to registration_select_path
      end
    else
      snscredential = SnsCredential.find_sns(oauth)
      @user = SnsCredential.check_sns(snscredential, oauth)
      bypass_sign_in(@user)
      redirect_to root_path, notice: 'ログインしました'
    end
  end

  def failure
    redirect_to root_path
  end



  # private
  # def basic_action
  #   @omniauth = request.env['omniauth.auth']
  #   if @omniauth.present?
  #     @profile = User.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
  #     if @profile
  #       @profile.set_values(@omniauth)
  #       sign_in(:user, @profile)
  #     else
  #       @profile = User.new(provider: @omniauth['provider'], uid: @omniauth['uid'])
  #       email = @omniauth['info']['email'] ? @omniauth['info']['email'] : "#{@omniauth['uid']}-#{@omniauth['provider']}@example.com"
  #       @profile = current_user || User.create!(provider: @omniauth['provider'], uid: @omniauth['uid'], email: email, name: @omniauth['info']['name'], avater: @omniauth['info']['pictureUrl'], password: Devise.friendly_token[0, 20])
  #       @profile.set_values(@omniauth)
  #       sign_in(:user, @profile)
  #       redirect_to edit_user_path(@profile.user.id) and return
  #     end
  #   end
  #   flash[:notice] = "ログインしました"
  #   redirect_to root_path
  # end

  # def fake_email(uid,provider)
  #     return "#{auth.uid}-#{auth.provider}@example.com"
  # end

end