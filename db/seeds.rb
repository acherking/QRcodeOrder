# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Authentication.create(authentication_str: "00000000", table_id: 1)
Authentication.create(authentication_str: "11111111", table_id: 2)
Authentication.create(authentication_str: "22222222", table_id: 3)
Authentication.create(authentication_str: "33333333", table_id: 4)
Authentication.create(authentication_str: "44444444", table_id: 5)
Authentication.create(authentication_str: "55555555", table_id: 6)
Authentication.create(authentication_str: "66666666", table_id: 1)
Authentication.create(authentication_str: "77777777", table_id: 1)
Authentication.create(authentication_str: "88888888", table_id: 1)
Authentication.create(authentication_str: "99999999", table_id: 1)
Table.create(name: "吧台", authentication_id: 1, statu:false)
Table.create(name: "黑A-11111", authentication_id: 2, statu:false)
Table.create(name: "黑A-22222", authentication_id: 3, statu:false)
Table.create(name: "黑A-33333", authentication_id: 4, statu:false)
Table.create(name: "黑A-44444", authentication_id: 5, statu:false)
Table.create(name: "黑A-55555", authentication_id: 6, statu:false)
Table.create(name: "黑A-66666", authentication_id: 1, statu:true)
Table.create(name: "黑A-77777", authentication_id: 1, statu:true)
Table.create(name: "黑A-88888", authentication_id: 1, statu:true)
Table.create(name: "黑A-99999", authentication_id: 1, statu:true)

User.create(name: "admin1", password: "199285", password_confirmation: "199285")
User.first.toggle!(:admin)
User.create(name: "admin2", password: "199285", password_confirmation: "199285")
User.last.toggle!(:admin)
User.create(name: "liangcai1", liangcai: true, password: "888888", password_confirmation: "888888")
User.create(name: "liangcai2", liangcai: true, password: "888888", password_confirmation: "888888")
User.create(name: "bayuan1", jiushui: true, password: "888888", password_confirmation: "888888")
User.create(name: "bayuan2", jiushui: true, password: "888888", password_confirmation: "888888")
User.create(name: "shouyin1", maidan: true, password: "888888", password_confirmation: "888888")
User.create(name: "shouyin2", maidan: true, password: "888888", password_confirmation: "888888")
User.create(name: "zhuachuan1", zhuachuan: true, password: "888888", password_confirmation: "888888")
User.create(name: "zhuachuan2", zhuachuan: true, password: "888888", password_confirmation: "888888")
User.create(name: "waiter1", chuancai: true, huanzhuo: true, password: "888888", password_confirmation: "888888")
User.create(name: "waiter2", chuancai: true, huanzhuo: true, password: "888888", password_confirmation: "888888")
User.create(name: "chuancai1", chuancai: true, password: "888888", password_confirmation: "888888")
User.create(name: "chuancai2", chuancai: true, password: "888888", password_confirmation: "888888")


Branch.create(name: "吧台")
Branch.create(name: "后厨")
Branch.create(name: "凉菜部")

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

food_type_2_list = [
  [2, "羊肉串", 3],
  [2, "牛肉串", 3],
  [2, "牛肉筋", 3],
  [2, "肥牛心管", 3],
  [2, "肥牛板筋", 3],
  [2, "肥牛亮筋", 3],
  [2, "骨肉相连", 3],
  [2, "肥牛筋皮", 3],
  [2, "香辣鸡脖", 4],
  [2, "烤土豆片", 2],
  [2, "烤地瓜片", 2],
  [2, "蚕蝇", 5],
  [2, "风味脆骨", 3],
  [2, "黑胡椒鸡翅", 8],
  [2, "新奥尔良烤翅", 7],
  [2, "V12带劲辣烤翅", 8],
  [2, "蜜汁鸡翅", 8],
  [2, "培根金针菇", 4],
  [2, "香烤掌中宝", 3],
  [2, "风味干豆腐卷", 10],
  [2, "烤韭菜", 3],
  [2, "农村辣椒", 3],
  [2, "烤鳕鱼", 12]                    
]

food_type_3_list = [
  [3, "素拍黄瓜", 12],
  [3, "捞汁什锦", 18],
  [3, "水憩肚", 24],
  [3, "老醋双脆", 22],
  [3, "牛肉老虎菜", 24],
  [3, "蓝莓山药", 28],
  [3, "木耳辣根", 10],
  [3, "土豆丝", 12],
  [3, "果仁菠菜", 12],
  [3, "俄式酸黄瓜", 16],
  [3, "117加油站", 28],
  [3, "花生开合", 12],
  [3, "水果沙拉", 24]
]

food_type_4_list = [
  [4, "夫妻肺片", 35],
  [4, "口水鸡", 32],
  [4, "麻辣油麦菜", 18],
  [4, "渝味凉粉", 18]
]

food_type_5_list = [
  [5, "锡纸金针磨", 18],
  [5, "锡纸大虾", 24],
  [5, "锡纸土豆", 10]
]

food_type_6_list = [
  [6, "嘎达汤", 5],
  [6, "烤面包片", 2],
  [6, "香烤臭夹馍", 3],
]

food_type_7_list = [
  [7, "毛肚锅", 25],
  [7, "牛肚", 1.5],
  [7, "金针菇", 6],
  [7, "木耳", 6],
  [7, "干豆腐", 1],
  [7, "鸡丸", 1.5],
  [7, "青拼", 12],
  [7, "酸菜", 7],
  [7, "海带", 7],
  [7, "水晶粉", 7],
]

food_type_8_list = [
  [8, "雪碧", 5],
  [8, "可乐", 5],
  [8, "健力宝", 5],
  [8, "荔枝", 5],
  [8, "怡宝矿泉水", 4],
  [8, "进口果汁", 38],
  [8, "蓝莓汁", 28],
  [8, "雪花银装", 10],
  [8, "雪花纯生", 12],
  [8, "花脸", 22],
  [8, "花旦", 22],
  [8, "凯撒黑啤", 38],
  [8, "凯撒黄啤", 38],
  [8, "凯撒窖藏", 42],
  [8, "餐巾纸", 2]
]

food_type_1_list.each do |food_type_id, name, price|
  Food.create(food_type_id: food_type_id, name: name, price: price, branch_id: 2)
end

food_type_2_list.each do |food_type_id, name, price|
  Food.create(food_type_id: food_type_id, name: name, price: price, branch_id: 2)
end

food_type_3_list.each do |food_type_id, name, price|
  Food.create(food_type_id: food_type_id, name: name, price: price, branch_id: 3)
end

food_type_4_list.each do |food_type_id, name, price|
  Food.create(food_type_id: food_type_id, name: name, price: price, branch_id: 2)
end

food_type_5_list.each do |food_type_id, name, price|
  Food.create(food_type_id: food_type_id, name: name, price: price, branch_id: 2)
end

food_type_6_list.each do |food_type_id, name, price|
  Food.create(food_type_id: food_type_id, name: name, price: price, branch_id: 2)
end

food_type_7_list.each do |food_type_id, name, price|
  Food.create(food_type_id: food_type_id, name: name, price: price, branch_id: 2)
end

food_type_8_list.each do |food_type_id, name, price|
  Food.create(food_type_id: food_type_id, name: name, price: price, branch_id: 1)
end
