crumb :root do
  link 'ホーム', root_path
end

crumb :topics_index do
  link '投稿一覧', topics_path
  parent :root
end

crumb :topics_new do
  link "新規投稿"
  parent :root
end


crumb :topics_show do
  if params[:controller] == 'chat_rooms' && params[:action] == 'show'
    @topic = Topic.find(params[:topic_id])
    link "トッピック: #{@topic.title}", topic_path(params[:topic_id])
  else
    @topic = Topic.find(params[:id])
    link "トッピック: #{@topic.title}"
  end
  parent :topics_index
end

crumb :user_chat_rooms_index do
  link "メッセージ一覧",user_chat_rooms_path(user_id:current_user.id)
  parent :user_mypage
end

crumb :chat_rooms_show do
  link "メッセージルーム"
  parent :user_chat_rooms_index
end

crumb :user_topics do
  link "ユーザー投稿一覧",user_topics_path(id:current_user.id)
  parent :user_mypage
end

crumb :user_mypage do
  link "マイページ",user_mypage_path(id:current_user.id)
  parent :root
end

crumb :users_topic_chat_rooms do
  @topic = Topic.find(params[:topic_id])
  link "#{@topic.title}の返信一覧"
  parent :user_topics
end

# crumb :logout do
#   link 'ログアウト', logout_users_path
# end

# マイページ ーーーーーーーーーーーーーー
# crumb :user_show do
#   if params[:controller] == 'users' && params[:action] == 'show'
#     @user = User.find(params[:id])
#     unless @user.id == current_user.id
#       link "#{@user.name}さん", user_path(@user.id)
#     else
#       link "マイページ", user_path(current_user.id)
#     parent :root
#     end
#   else
#     link "マイページ", user_path(current_user.id)
#     parent :root
#   end
# end
# # ーーーーーーーーーーーーーーーーーーーーーーーーーー

# crumb :room_index do
#   link '受信BOX', user_rooms_path(current_user)
#   parent :user_show
# end

# crumb :message_room do
#   # 1件しかレコードが入っていないことはわかってるので、配列からfirstで取り出しハッシュ形式に変わる。これをしないと配列に入った値をeachで取り出さないといけない
#   @room_id = Entry.where(room_id: params[:id]).where.not(user_id: current_user.id).first
#   @reception_user = User.find(@room_id.user_id)
#   link "#{@reception_user.name}さんとのチャットルーム", user_room_path
#   parent :room_index
# end

# crumb :user_edit do
#   link 'アカウント情報更新'
#   parent :user_show
# end

# crumb :post_product do
#   link '作品投稿'
#   parent :user_show
# end

# crumb :product_index do
#   link '投稿一覧'
#   parent :user_show
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
