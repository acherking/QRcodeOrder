# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

food_type_list = [
  "车酷特色",
  "经典烧烤系列",
  "下酒凉菜系列",
  "川菜系列",
  "锡纸系列",
  "主食系列",
  "川味麻辣毛肚系列",
  "饮料酒水"
]

food_type_list.each do |name|
  FoodType.create(name: name)
end

food_type_1_list = [
  [1, "黑胡椒牛助排", 9],
  [1, "117小牛腰", 4],
  [1, "车酷羊五花", 8],
  [1, "五花肉酸菜卷", 5],
  [1, "飘香牛肉", 8],
  [1, "靠！大对虾！", 58],
  [1, "培根芝士鲜虾卷", 8],
  [1, "五香盐烤鸡胗", 5],
  [1, "117烤肠", 6],
  [1, "蜜汁梅肉", 3],
  [1, "香烤猪蹄", 22],
  [1, "酱香烤鸡手", 5],
  [1, "啤酒烤鸡心", 3],
  [1, "羊蛋蛋", 15],
  [1, "涡轮增压肥牛腰", 10],
  [1, "机械增压肥羊腰", 12]
]

food_type_1_list.each do |food_type_id, name, price|
  Food.create(food_type_id: food_type_id, name: name, price: price)
end
