# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create, :new, :campany]
  before_action :configure_account_update_params, only: [:update]
  before_action :set_form_data, only: [:new, :campany, :edit]

  # 企業の登録フォーム
  def campany
    @user = User.new
    @user.build_campany
  end
  # POST /resource
  def create
    super
    user = User.new(configure_sign_up_params)
    user.save
  end
  # GET /resource/edit
  def edit
    super
  end

  protected
  def set_form_data
    @category = Category.all
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:name, :category_id, campany_attributes: [:campany_name, :campany_logo, :category_id, :campany_url, :tel, :staff_last_name_kana, :staff_first_name_kana]])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avater, :category_id], campany_attributes: [:campany_name, :campany_logo, :category_id, :campany_url, :email, :tel, :staff_last_name_kana, :staff_first_name_kana])
  end
end
  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end


  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end