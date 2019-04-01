# Category
fashion, neil, hair, architecture, space, interior, furniture, lighting, product, car, jewelry, goods, character, graphic, ceramics, food = Category.create!([
  {name: "ファッションデザイン"}, {name: "ネイルデザイン"}, {name: "ヘアデザイン"}, {name: "建築デザイン"}, {name: "空間デザイン"}, {name: "インテリアデザイン"}, {name: "家具デザイン"}, {name: "照明デザイン"}, {name: "プロダクトデザイン"}, {name: "カーデザイン"}, {name: "ジュエリーデザイン"}, {name: "雑貨デザイン"}, {name: "キャラクターデザイン"}, {name: "グラフィックデザイン"}, {name: "陶芸"}, {name: "フード"}, {name: "アート"}, {name: "その他デザイン・アート"}
])
#Userモデル
User.create!(
  name: 'a-designer', email: 'a@test.com', password: '111111', category_id: "1",
)

Product.create!(
  user_id: "1", category_id: "1", name: "美の巨匠", introduction: "歴史に残る名作",
)

#Imageモデル
Image.create!(
  image_path: "", product_id: "1",
)
#Campanyモデル
Campany.create!(
  name: 'Aデザインオフィス', category_id: "1", campany_url: 'http://www.abc.co.jp', email: 'abc@test.com', tel: '09012345678', staff_last_name_kana: 'モンキー', staff_first_name_kana: 'ルフィー', password: '111111', password_confirmation: '111111'
  )

Offer.create!(
  campany_id: "1", offer_massege: '社員１名募集中',
)

Massege.create!(
  user_id: '1', campany_id: '1', massege: '良い作品',
)

Like.create!(
  user_id: '1', campany_id: '1', product_id: '1',
)

#Funモデル
Fun.create!(
  user_id: '1', campany_id: '1',
)
