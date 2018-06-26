# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.new(:email => 'aaa@example.com', :password => 'password')
user.save!

Profile.create(
    :user_id => user.id,
    :nicname => "AAA",
    :public => "公開",
    :height => "170",
    :start_weight => "65",
    :sex => "男",
    :age => "30",
    :message => "Hello World!!"
)

(1..10).each do |i|
  Weight.create(:user_id => user.id, :value => "65.1")
  Weight.create(:user_id => user.id, :value => "65.2")
  Weight.create(:user_id => user.id, :value => "65.3")
  Weight.create(:user_id => user.id, :value => "65.4")
  Weight.create(:user_id => user.id, :value => "65.5")
  Weight.create(:user_id => user.id, :value => "65.6")
  Weight.create(:user_id => user.id, :value => "65.7")
  Weight.create(:user_id => user.id, :value => "65.8")
  Weight.create(:user_id => user.id, :value => "65.9")
  Weight.create(:user_id => user.id, :value => "66")
end