# Category
fashion, neil, hair, architecture, space, interior, furniture, lighting, product, car, jewelry, goods, character, graphic, ceramics, food = Category.create!([
  {name: "ファッションデザイン"}, {name: "ネイルデザイン"}, {name: "ヘアデザイン"}, {name: "建築デザイン"}, {name: "空間デザイン"}, {name: "インテリアデザイン"}, {name: "家具デザイン"}, {name: "照明デザイン"}, {name: "プロダクトデザイン"}, {name: "カーデザイン"}, {name: "ジュエリーデザイン"}, {name: "雑貨デザイン"}, {name: "キャラクターデザイン"}, {name: "グラフィックデザイン"}, {name: "陶芸"}, {name: "フード"}, {name: "アート"}, {name: "その他デザイン・アート"}
])
#Userモデル
User.create!([
  {name: 'ケンイチ', email: 'ken@test.com', password: '111111', category_id: "1"}, {name: 'ABCデザインオフィス', email: 'b@t.com', password: '111111', category_id: "2"}
])

Product.create!(
  user_id: '1', category_id: '1', name: "美の巨匠", introduction: "歴史に残る名作",
)

#Imageモデル
Image.create!(
  image_path: "", product_id: "1",
)
#Campanyモデル
Campany.create!(
  user_id: '2', staff_last_name_kana: 'モンキー', staff_first_name_kana: 'ルフィー', campany_url: 'http://www.abc.co.jp', tel: '09012345678', campany_logo: '',
)

Like.create!(
  user_id: '1', product_id: '1',
)

#Funモデル
Fun.create!(
  {follower_id: '1', followed_id: '2'},
)