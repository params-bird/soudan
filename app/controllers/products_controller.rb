class ProductsController < ApplicationController
  before_action :set_form_data, only: [:new, :edit]

def show
  @product = Product.find(current_user.id)
  @like = Like.new
end


  def new
    @product = Product.new
    1.times { @product.images.build }
  end

  def create
    @product = Product.new(products_params)
    # if @product.save
    #   redirect_to root_path
    #   flash[:success] = "出品が完了しました"
    # else
    #   render :new
    #   flash[:danger] = "必須項目をすべて選択してください"
    # end
  end

  def edit
    @product = Product.find_by(id: params[:id])
    @category = @product.category
  end

  def update
    product = Product.find_by(id: params[:id])
    Product.update(update_product_params) if user.id == current_user.id
    @product = Product.find_by(id: params[:id])
    @category = @product.category
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy if user_id == current_user.id
    redirect_to root_path, notice: '作品を削除しました'
  end

  protected
  def set_form_data
    @category = Category.all
  end

  private
  def products_params
    params.require(:product).permit(:category_id, :name, :introduction,  images_attributes: [:image_path]).merge(user_id: current_user.id)
  end


  def update_products_params
    params.require(:product).permit(:category_id, :name, :introduction, images_attributes: [:image_path, :_destroy, :id]).merge(user_id: current_user.id)
  end

end