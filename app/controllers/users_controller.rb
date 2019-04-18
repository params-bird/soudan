class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy, :user_products_index]
  before_action :set_user, only: [:show, :update, :destroy, :user_products_index]

  # GET /users
  # GET /users.json
  def index
    @user = User.new
    @users = User.all
  end
  # GET /users/1
  # GET /users/1.json
  def show
    # @user=User.find(params[:id])
    @current_user_entry=Entry.where(user_id: current_user.id)
    @user_entry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id    #ログイン中のユーザーとマイページ所有のユーザーが合致するか
    else
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id then   #ログインユーザーとマイページ所有者のチャットルームがあるか確認
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end
      if @is_room         #値が入っていれば（roomがすでにあれば）
      else    #値が入っていなければ（roomがなければ）新しいroomインスタンスを作る。
        @room = Room.new
        @entry = Entry.new
      end
    end
  end


  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # 企業の更新フォーム
  def edit_campany
    @user = User.find(current_user.id)
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(update_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_products_index
    @products = @user.products.includes(:images)
  end

  private
    def set_user
        @user = User.find(params[:id])
    end


    def update_params
      params.require(:user).permit(:name, :avater, :category_id, campany_attributes: [:id, :campany_name, :campany_logo, :category_id, :campany_url, :email, :tel, :staff_last_name_kana, :staff_first_name_kana])
    end
end
