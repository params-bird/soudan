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
  link "#{current_user.name}"
  parent :root
end

crumb :user_edit do
  link "ユーザー情報編集"
  parent :user_mypage
end

crumb :user_signup do
  link "アカウント登録"
  parent :root
end

crumb :user_login do
  link "ログイン"
  parent :root
end

crumb :users_topic_chat_rooms do
  @topic = Topic.find(params[:topic_id])
  link "#{@topic.title}の返信一覧"
  parent :user_topics
end

crumb :topics_search do
  link "カテゴリー検索"
  parent :root
end
