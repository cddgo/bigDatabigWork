
# 按月份每天查购物量
select count(distinct uid), day(visit_date) from user_action where behavior_type='4' group by day(visit_date);

#查看时间区间
SELECT MIN(visit_date), MAX(visit_date) FROM user_action

#按省份查浏览量
select count(id), province from user_action where behavior_type='1' group by province;

# 数据修正
UPDATE user_action set province="重庆" WHERE province="重庆市"
UPDATE user_action set province="北京" WHERE province="北京市"
UPDATE user_action set province="天津" WHERE province="天津市"
UPDATE user_action set province="上海" WHERE province="上海市"
UPDATE user_action set province="天津" WHERE province="天津市"

#分析哪一类商品被购买总量前十的商品和被购买总量 
select item_category from user_action WHERE behavior_type='4' group by item_category order by COUNT(*) DESC LIMIT 10

select count(*), item_category, behavior_type from user_action 
where item_category in(select item_category from user_action WHERE behavior_type='4' group by item_category order by COUNT(*) DESC LIMIT 10)
group by item_category,behavior_type order by COUNT(*) DESC LIMIT
SELECT * from (
(select COUNT(*) count, item_category, behavior_type from user_action WHERE behavior_type='1' group by item_category order by COUNT(*) DESC LIMIT 10) t1,
(select COUNT(*) count, item_category, behavior_type from user_action WHERE behavior_type='2' group by item_category order by COUNT(*) DESC LIMIT 10) t2,
(select COUNT(*) count, item_category, behavior_type from user_action WHERE behavior_type='3' group by item_category order by COUNT(*) DESC LIMIT 10) t3,
(select COUNT(*) count, item_category, behavior_type from user_action WHERE behavior_type='4' group by item_category order by COUNT(*) DESC LIMIT 10) t4)
SELECT COUNT(*) from user_action


select COUNT(*) count, item_category, behavior_type from user_action WHERE behavior_type='1' group by item_category order by COUNT(*) DESC LIMIT 10  UNION
select COUNT(*) count, item_category, behavior_type from user_action WHERE behavior_type='2' group by item_category order by COUNT(*) DESC LIMIT 10 t2 UNION
(select COUNT(*) count, item_category, behavior_type from user_action WHERE behavior_type='3' group by item_category order by COUNT(*) DESC LIMIT 10) t3 UNION
(select COUNT(*) count, item_category, behavior_type from user_action WHERE behavior_type='4' group by item_category order by COUNT(*) DESC LIMIT 10) t4 UNION
union 
