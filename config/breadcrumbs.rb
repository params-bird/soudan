crumb :root do
  link 'ホーム', root_path
end

# crumb :logout do
#   link 'ログアウト', logout_users_path
# end


# ユーザ一覧ページヘのパンくずリスト
crumb :user_show do
  link "マイページ"
  parent :root
end

crumb :room_index do
  link '受信BOX', user_rooms_path((current_user))
  parent :user_show
end

crumb :message_room do
  link 'チャットルーム', user_room_path
  parent :room_index
end

# crumb :users_edit do
#   link 'プロフィール', edit_user_registration_path
#   parent :users_show
# end


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
