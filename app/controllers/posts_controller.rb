class PostsController < ApplicationController
  before_action :set_form_data, only: [:new, :edit]

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(posts_params)
    if @posts.save
      redirect_to root_path
      flash[:success] = "出品が完了しました"
    else
      redirect_to new_post_path
      flash[:danger] = "必須項目をすべて選択してください"
    end
  end

  def edit
    @posts = Post.find_by(id: params[:id])
    @category = @posts.category
  end

  def update
    post = Post.find_by(id: params[:id])
    Post.update(update_product_params) if product.seller_id == current_user.id
    @posts = Post.find_by(id: params[:id])
    @category = @posts.category
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy if user_id == current_user.id
    redirect_to root_path, notice: '作品を削除しました'
  end

  protected
  def set_form_data
    @category = Category.all
  end

  private
  def posts_params
    params.require(:post).permit(:category_id, :name, :introduction, images_attributes: [:image_path]).merge(user_id: current_user.id)
  end
  # def posts_params
  #   params.require(:Post).permit(:category_id, :name, :introduction, images_attributes: [:image_path]).merge(user_id: current_user.id)
  # end

  def update_posts_params
    params.require(:post).permit(:category_id, :name, :introduction, images_attributes: [:image_path, :_destroy, :id]).merge(user_id: current_user.id)
  end

end