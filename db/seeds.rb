
#Userモデル
User.create!([
  {name: 'ユーザー１', avater: open("#{Rails.root}/db/fixtures/images/users/user_1.png"), email: 'a@test.com', password: '111111', },
  {name: 'ユーザー２', avater: open("#{Rails.root}/db/fixtures/images/users/user_2.png"), email: 'b@test.com', password: '111111', },
  {name: 'ユーザー３', avater: open("#{Rails.root}/db/fixtures/images/users/user_3.png"), email: 'c@test.com', password: '111111', },
])
