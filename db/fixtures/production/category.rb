Category.seed(:id,
  {id:1, name:"その他"},
  {id:2, name:"仕事"},
  {id:3, name:"人間関係"},
  {id:4, name:"恋愛"},
  {id:5, name:"結婚"},
  {id:6, name:"子育て"},
  {id:7, name:"介護"},
  {id:8, name:"勉強"},
  {id:9, name:"進路"},
  {id:10, name:"留学"},
  {id:11, name:"就活"},
  {id:12, name:"転職"},
  {id:13, name:"将来"},
  {id:14, name:"旅行"},
  {id:15, name:"家選び"},
  {id:16, name:"老後"},
  {id:17, name:"金銭関係"},
  {id:18, name:"プログラム"},
)

# 前回のシード画像を削除
require 'fileutils'
Dir.chdir 'public/uploads/category/' #僕はここに保存しているだけなので適宜変更
FileUtils.rm(Dir.glob('*.*'))

Category.seed do |s|
  s.id = 2
  s.image = Rails.root.join("db/fixtures/images/categories/paperwork-3154814_640.jpg").open
end

Category.seed do |s|
  s.id = 3
  s.image = Rails.root.join("db/fixtures/images/categories/people-2557396_640.jpg").open
end

Category.seed do |s|
  s.id = 4
  s.image = Rails.root.join("db/fixtures/images/categories/love-3061483_640.jpg").open
end

Category.seed do |s|
  s.id = 5
  s.image = Rails.root.join("db/fixtures/images/categories/wedding-628515_640.jpg").open
end

Category.seed do |s|
  s.id = 6
  s.image = Rails.root.join("db/fixtures/images/categories/affection-1866868_640.jpg").open
end

Category.seed do |s|
  s.id = 7
  s.image = Rails.root.join("db/fixtures/images/categories/hands-736244_640.jpg").open
end

Category.seed do |s|
  s.id = 8
  s.image = Rails.root.join("db/fixtures/images/categories/writing-828911_640.jpg").open
end

Category.seed do |s|
  s.id = 9
  s.image = Rails.root.join("db/fixtures/images/categories/technology-791029_640.jpg").open
end

Category.seed do |s|
  s.id = 10
  s.image = Rails.root.join("db/fixtures/images/categories/plane-841441_640.jpg").open
end

Category.seed do |s|
  s.id = 11
  s.image = Rails.root.join("db/fixtures/images/categories/business-1149630_640.jpg").open
end

Category.seed do |s|
  s.id = 12
  s.image = Rails.root.join("db/fixtures/images/categories/business-3167295_640.jpg").open
end

Category.seed do |s|
  s.id = 13
  s.image = Rails.root.join("db/fixtures/images/categories/future-2372183_640.jpg").open
end

Category.seed do |s|
  s.id = 14
  s.image = Rails.root.join("db/fixtures/images/categories/passport-2642172_640.jpg").open
end

Category.seed do |s|
  s.id = 15
  s.image = Rails.root.join("db/fixtures/images/categories/house-1353389_640.jpg").open
end

Category.seed do |s|
  s.id = 16
  s.image = Rails.root.join("db/fixtures/images/categories/hands-981400_640.jpg").open
end

Category.seed do |s|
  s.id = 17
  s.image = Rails.root.join("db/fixtures/images/categories/euro-870757_640.jpg").open
end

Category.seed do |s|
  s.id = 18
  s.image = Rails.root.join("db/fixtures/images/categories/work-731198_640.jpg").open
end