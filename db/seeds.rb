
Category.create!([
  {name: "ファッションデザイン", image: open("#{Rails.root}/db/fixtures/images/1.jpg")},
  {name: "ネイルデザイン", image: open("#{Rails.root}/db/fixtures/images/2.jpg")},
  {name: "ヘアデザイン", image: open("#{Rails.root}/db/fixtures/images/3.jpg")},
  {name: "建築デザイン", image: open("#{Rails.root}/db/fixtures/images/4.jpg")},
  # {name: "空間デザイン", image: open("#{Rails.root}/db/fixtures/images/5.jpg")},
  {name: "インテリアデザイン", image: open("#{Rails.root}/db/fixtures/images/6.jpg")},
  {name: "家具デザイン", image: open("#{Rails.root}/db/fixtures/images/7.jpg")},
  {name: "照明デザイン", image: open("#{Rails.root}/db/fixtures/images/8.jpg")},
  {name: "カーデザイン", image: open("#{Rails.root}/db/fixtures/images/10.jpg")},
  {name: "ジュエリーデザイン", image: open("#{Rails.root}/db/fixtures/images/11.jpg")},
  {name: "キャラクターデザイン", image: open("#{Rails.root}/db/fixtures/images/13.jpg")},
  {name: "グラフィックデザイン", image: open("#{Rails.root}/db/fixtures/images/14.jpg")},
  {name: "陶芸", image: open("#{Rails.root}/db/fixtures/images/15.jpg")},
  {name: "フード", image: open("#{Rails.root}/db/fixtures/images/16.jpg")},
  {name: "アート", image: open("#{Rails.root}/db/fixtures/images/17.jpg")},
  {name: "その他デザイン・アート", image: open("#{Rails.root}/db/fixtures/images/18.jpg")},
])

#Userモデル
User.create!([
  {name: 'デザイン太郎', avater: open("#{Rails.root}/db/fixtures/images/users/1.png"), email: 'a@test.com', password: '111111', category_id: "6",},
  {name: 'デザイン次郎', avater: open("#{Rails.root}/db/fixtures/images/users/2.png"), email: 'b@test.com', password: '111111', category_id: "6",},
  {name: 'デザイン三郎', avater: open("#{Rails.root}/db/fixtures/images/users/3.png"), email: 'c@test.com', password: '111111', category_id: "6",},
  {name: ' 大成建設事務所', avater: open("#{Rails.root}/db/fixtures/images/users/4.png"), email: 'shimizu@test.com', password: '111111', category_id: "6",},
  {name: ' 竹中インテリアオフィス', avater: open("#{Rails.root}/db/fixtures/images/users/5.png"), email: 'takenaka@test.com', password: '111111', category_id: "5",},
])

Product.create!([
  {user_id: '1', category_id: '6', name: "椅子をデザインしました！", introduction: "心地よい椅子",},
  {user_id: '1', category_id: '6', name: "こんな椅子はどうですか？", introduction: "観賞用椅子",},
  {user_id: '2', category_id: '5', name: "プログラマー向けにデザインしました", introduction: "疲れない椅子",},
  {user_id: '3', category_id: '5', name: "こんな空間あったらいいな", introduction: "心地よい空間",},
])

#Imageモデル
Image.create!(
  image_path: "", product_id: "1",
)
#Campanyモデル
Campany.create!([
  {user_id: '4', staff_last_name_kana: 'タケナカ', staff_first_name_kana: 'ナオト', campany_url: 'http://www.takenaka.test', tel: '09012341234', campany_logo: '',},
  {user_id: '5', staff_last_name_kana: 'シミズ', staff_first_name_kana: 'イチロウ', campany_url: 'http://www.shimizu.test', tel: '08056785678', campany_logo: '',},
])

Like.create!([
  {user_id: '2', product_id: '1',},
  {user_id: '5', product_id: '1',},
  {user_id: '5', product_id: '2',},
])

#Funモデル
Fun.create!([
  {follower_id: '5', followed_id: '1'},
])

# Roomモデル　DMメッセージ　個々の部屋番号　ーーーーーーーーーーー〜
Room.create!([
  {name: '1'},
  {name: '2'},
])

# Entryモデル　DMメッセージ　個々の部屋番号　ーーーーーーーーーーー〜
Entry.create!([
  {user_id: '4', room_id: '1'},
  {user_id: '1', room_id: '1'},
  {user_id: '5', room_id: '2'},
  {user_id: '1', room_id: '2'},
])

# Messageモデル　誰がどの部屋で何をコメントしたか　ーーーーーーーーーーー〜
Message.create!([
  {user_id: '4', room_id: '1', content: 'デザイン太郎さん、はじめまして。'},
  {user_id: '1', room_id: '1', content: '大成建設事務所さん、コメントありがとうございます。'},
  {user_id: '5', room_id: '2', content: 'デザイン太郎さん、はじめまして。'},
  {user_id: '1', room_id: '2', content: '竹中インテリアオフィスさん、コメントありがとうございます。'},
  {user_id: '5', room_id: '2', content: '月曜日に面接可能ですか？'},
])