crumb :root do
  link 'ホーム', root_path
end

# crumb :logout do
#   link 'ログアウト', logout_users_path
# end

# マイページ ーーーーーーーーーーーーーー
crumb :user_show do
  if params[:controller] == 'users' && params[:action] == 'show'
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      link "#{@user.name}さん", user_path(@user.id)
    else
      link "マイページ", user_path(current_user.id)
    parent :root
    end
  else
    link "マイページ", user_path(current_user.id)
    parent :root
  end
end
# ーーーーーーーーーーーーーーーーーーーーーーーーーー

crumb :room_index do
  link '受信BOX', user_rooms_path(current_user)
  parent :user_show
end

crumb :message_room do
  # 1件しかレコードが入っていないことはわかってるので、配列からfirstで取り出しハッシュ形式に変わる。これをしないと配列に入った値をeachで取り出さないといけない
  @room_id = Entry.where(room_id: params[:id]).where.not(user_id: current_user.id).first
  @reception_user = User.find(@room_id.user_id)
  link "#{@reception_user.name}さんとのチャットルーム", user_room_path
  parent :room_index
end

crumb :user_edit do
  link 'アカウント情報更新'
  parent :user_show
end

crumb :post_product do
  link '作品投稿'
  parent :user_show
end

crumb :product_index do
  link '投稿一覧'
  parent :user_show
end


# 検索ページーーーーーーーーーーーーーーーーーーーーーーーー
# crumb :search do
# @keyword = params[:keyword]
# link @keyword, search_products_path
# end
# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

# 商品詳細画面ーーーーーーーーーーーーーーーーーーーーーーーー
# crumb :products_category_0 do
# @product = Product.find(params[:id])
# link @product.category.root.name, product_path
# end

# crumb :products_category_1 do
# @product = Product.find(params[:id])
# link @product.category.parent.name, product_path
# parent :products_category_0
# end

# crumb :products_category_2 do
# @product = Product.find(params[:id])
# link @product.category.name, product_path
# parent :products_category_1
# end
# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
