--  with AA_LTV_sub as  
--  (
--  select *,
--  trial_start_dt as start_dt,
--  date_trunc(trial_start_dt , Month) as Signup_month,
--  case when num_shows_f90<6 then num_shows_f90
--   else 6 end as subscription_platform
--  from 
--  temp_rm.Loyalty_Subs_base
-- )

 with AA_LTV_sub as  
 (
 select *,
 trial_start_dt as start_dt,
 date_trunc(trial_start_dt , Month) as Signup_month,
 Pltfrm_type as subscription_platform
 from 
 temp_rm.Loyalty_Subs_base_device
)


--  with AA_LTV_sub as  
--  (
--  select *,
--  trial_start_dt as start_dt,
--  date_trunc(trial_start_dt , Month) as Signup_month,
--  case when Live_TV_minwatch_f90<252 then 'less than 4hr'
--   when Live_TV_minwatch_f90 between 252 and 722 then 'Between 4 and 12hr'
--   when Live_TV_minwatch_f90>722 then 'Grtr than 12hr' end as subscription_platform
--  from 
--  temp_rm.Loyalty_Subs_base_live_min
--  where Live_TV_minwatch_f90>0
-- )


--  with AA_LTV_sub as  
--  (
--  select *,
--  trial_start_dt as start_dt,
--  date_trunc(trial_start_dt , Month) as Signup_month,
--  case when ttl_minwatch<485 then 'less than 8hr'
--   when ttl_minwatch between 485 and 1720 then 'Between 8 and 29hr'
--   when ttl_minwatch>1720 then 'Grtr than 29hr' end as subscription_platform
--  from 
--  temp_rm.Loyalty_Subs_base_live_min
-- )

-- select att_gp, count(distinct subscription_guid) as sub from AA_LTV_sub group by 1 order by 2 desc

, LTV_stg2 as (
select ov.Signup_month,
ov.subscription_platform,
case when total_starts is null then 0 else total_starts end as total_starts,
Subs_Retained_1 ,
case when ov.Signup_month< '2020-12-01' then Subs_Retained_2 else 0 end as Subs_Retained_2,
case when ov.Signup_month< '2020-11-01' then Subs_Retained_3 else 0 end as Subs_Retained_3,
case when ov.Signup_month< '2020-10-01' then Subs_Retained_4 else 0 end as Subs_Retained_4,
case when ov.Signup_month< '2020-09-01' then Subs_Retained_5 else 0 end as Subs_Retained_5,
case when ov.Signup_month< '2020-08-01' then Subs_Retained_6 else 0 end as Subs_Retained_6,
case when ov.Signup_month< '2020-07-01' then Subs_Retained_7 else 0 end as Subs_Retained_7,
case when ov.Signup_month< '2020-06-01' then Subs_Retained_8 else 0 end as Subs_Retained_8,
case when ov.Signup_month< '2020-05-01' then Subs_Retained_9 else 0 end as Subs_Retained_9,
case when ov.Signup_month< '2020-04-01' then Subs_Retained_10 else 0 end as Subs_Retained_10,
case when ov.Signup_month< '2020-03-01' then Subs_Retained_11 else 0 end as Subs_Retained_11,
case when ov.Signup_month< '2020-02-01' then Subs_Retained_12 else 0 end as Subs_Retained_12,
case when ov.Signup_month< '2020-01-01' then Subs_Retained_13 else 0 end as Subs_Retained_13,
case when ov.Signup_month< '2019-12-01' then Subs_Retained_14 else 0 end as Subs_Retained_14,
case when ov.Signup_month< '2019-11-01' then Subs_Retained_15 else 0 end as Subs_Retained_15,
case when ov.Signup_month< '2019-10-01' then Subs_Retained_16 else 0 end as Subs_Retained_16,
case when ov.Signup_month< '2019-09-01' then Subs_Retained_17 else 0 end as Subs_Retained_17,
case when ov.Signup_month< '2019-08-01' then Subs_Retained_18 else 0 end as Subs_Retained_18,
case when ov.Signup_month< '2019-07-01' then Subs_Retained_19 else 0 end as Subs_Retained_19,
case when ov.Signup_month< '2019-06-01' then Subs_Retained_20 else 0 end as Subs_Retained_20,
case when ov.Signup_month< '2019-05-01' then Subs_Retained_21 else 0 end as Subs_Retained_21,
case when ov.Signup_month< '2019-04-01' then Subs_Retained_22 else 0 end as Subs_Retained_22,
case when ov.Signup_month< '2019-03-01' then Subs_Retained_23 else 0 end as Subs_Retained_23,
case when ov.Signup_month< '2019-02-01' then Subs_Retained_24 else 0 end as Subs_Retained_24



from 
(

select Signup_month,
subscription_platform,
sum( Subs_Retained_1) as  Subs_Retained_1,
sum( Subs_Retained_2) as  Subs_Retained_2,
sum( Subs_Retained_3) as  Subs_Retained_3,
sum( Subs_Retained_4) as  Subs_Retained_4,
sum( Subs_Retained_5) as  Subs_Retained_5,
sum( Subs_Retained_6) as  Subs_Retained_6,
sum( Subs_Retained_7) as  Subs_Retained_7,
sum( Subs_Retained_8) as  Subs_Retained_8,
sum( Subs_Retained_9) as  Subs_Retained_9,
sum( Subs_Retained_10) as  Subs_Retained_10,
sum( Subs_Retained_11) as  Subs_Retained_11,
sum( Subs_Retained_12) as  Subs_Retained_12,

sum( Subs_Retained_13) as  Subs_Retained_13,
sum( Subs_Retained_14) as  Subs_Retained_14,
sum( Subs_Retained_15) as  Subs_Retained_15,
sum( Subs_Retained_16) as  Subs_Retained_16,
sum( Subs_Retained_17) as  Subs_Retained_17,
sum( Subs_Retained_18) as  Subs_Retained_18,
sum( Subs_Retained_19) as  Subs_Retained_19,
sum( Subs_Retained_20) as  Subs_Retained_20,
sum( Subs_Retained_21) as  Subs_Retained_21,
sum( Subs_Retained_22) as  Subs_Retained_22,
sum( Subs_Retained_23) as  Subs_Retained_23,
sum( Subs_Retained_24) as  Subs_Retained_24 
from
(
 select Signup_month,
 subscription_platform,
starting_paid_subs,
case when subsequent_month=1  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_1,
case when subsequent_month=2  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_2,
case when subsequent_month=3  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_3,
case when subsequent_month=4  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_4,
case when subsequent_month=5  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_5,
case when subsequent_month=6  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_6,
case when subsequent_month=7  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_7,
case when subsequent_month=8  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_8,
case when subsequent_month=9  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_9,
case when subsequent_month=10  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_10,
case when subsequent_month=11  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_11,
case when subsequent_month=12  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_12,
case when subsequent_month=13  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_13,
case when subsequent_month=14  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_14,
case when subsequent_month=15  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_15,
case when subsequent_month=16  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_16,
case when subsequent_month=17  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_17,
case when subsequent_month=18  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_18,
case when subsequent_month=19  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_19,
case when subsequent_month=20  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_20,
case when subsequent_month=21  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_21,
case when subsequent_month=22  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_22,
case when subsequent_month=23  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_23,
case when subsequent_month=24  then (starting_paid_subs-Cum_cancels) else 0 end as Subs_Retained_24 
from
 
 (
 
 Select t.*,running_sum as Cum_cancels ,
 begin_paid_subs as starting_paid_subs
 from 

  (
 select Signup_month,
subscription_platform,
 subsequent_month
 from
       (
       select distinct t.Signup_month,subscription_platform from (select r.* from AA_LTV_sub r)  dt 
       cross join
	   (select DATE_TRUNC(day_dt,MONTH) as Signup_month from dw_vw.days where day_dt between '2019-01-01' and '2020-12-01') t -- Change the date range here 
 
      )
      cross join 
      (
      select s.* from 
      (select row_number() over (order by day_dt) subsequent_month from dw_vw.days) s where subsequent_month <= 24) sb -- change the subsequent months
      ) t
    
      left join (
	  select Signup_Month,
    subscription_platform,
            subsequent_month as mn,
            SUM (cancels) OVER (PARTITION BY  Signup_month,subscription_platform ORDER BY subsequent_month) AS running_sum
            from (
             select Signup_month,
             subscription_platform,
			 case when (Days_actv/30)<=1 then 1 else CEILING(Days_actv/30) end as subsequent_month,
			 sum(users) as cancels
			 from (
             select Signup_month, 
             subscription_platform,
			 Days_actv,
			 count(distinct subscription_guid ) as users
			 from 
                               (
                               select t.*, 
                               DATE_DIFF(cast(case when expiration_dt is null OR expiration_dt>'2020-12-31' then '2021-01-01' else expiration_dt end as date), cast( start_dt as Date),DAY) +1 as Days_actv
							   from AA_LTV_sub t
 
                               ) a1 
                               where cast(expiration_dt as date)<='2020-12-31'
                               group by Signup_month, subscription_platform,
                               Days_actv) a2
            group by Signup_month,subscription_platform,
            case when (Days_actv/30)<=1 then 1
       else CEILING(Days_actv/30) end
       ) a3 
       ) can
       on (t.Signup_month=can.Signup_month
       and t.subsequent_month=can.mn
       and t.subscription_platform=can.subscription_platform)    
        left join ( 
       select Signup_month,   
       subscription_platform,
       count(distinct subscription_guid) as begin_paid_subs
                               from 
                               (
                               select t.*, 
                               DATE_DIFF(cast(case when expiration_dt is null OR expiration_dt>'2020-12-31' then '2021-01-01'  else expiration_dt end as date), cast( start_dt as Date),DAY) +1 as Days_actv
							   from AA_LTV_sub t
 
                               ) a1 
                               group by Signup_month    ,subscription_platform                      
                               ) a4
                               on (t.Signup_month=a4.Signup_month
                               and t.subscription_platform=a4.subscription_platform)
       ) a5
       ) a6
       group by Signup_month,subscription_platform
) ov
left join ( 
       select Signup_month,   
       subscription_platform,
       count(distinct subscription_guid ) as total_starts
                               from 
                               (
                               select t.*, 
                               DATE_DIFF(cast(case when expiration_dt is null OR expiration_dt>'2020-12-31' then '2021-01-01'  else expiration_dt end as date), cast( start_dt as Date),DAY) +1 as Days_actv
							   from AA_LTV_sub t
 
                               ) a1 
                               group by Signup_month,subscription_platform                             
                               ) strt
                               on (ov.Signup_month=strt.Signup_month
                               and ov.subscription_platform=strt.subscription_platform)
order by 2,1

)

-- select * from LTV_stg2
, LTV_stg3 as (
select Signup_month,subscription_platform,
total_starts,
coalesce((lag(total_starts,1)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l1,
coalesce((lag(total_starts,2)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l2,
    coalesce((lag(total_starts,3)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l3,
    coalesce((lag(total_starts,4)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l4,
    coalesce((lag(total_starts,5)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l5,
    coalesce((lag(total_starts,6)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l6,
    coalesce((lag(total_starts,7)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l7,
    coalesce((lag(total_starts,8)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l8,
    coalesce((lag(total_starts,9)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l9,
    coalesce((lag(total_starts,10)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l10,
    coalesce((lag(total_starts,11)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l11,
    coalesce((lag(total_starts,12)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l12,
    coalesce((lag(total_starts,13)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l13,
    coalesce((lag(total_starts,14)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l14,
    coalesce((lag(total_starts,15)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l15,
    coalesce((lag(total_starts,16)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l16,
    coalesce((lag(total_starts,17)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l17,
    coalesce((lag(total_starts,18)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l18,
    coalesce((lag(total_starts,19)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l19,
    coalesce((lag(total_starts,20)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l20,
    coalesce((lag(total_starts,21)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l21,
    coalesce((lag(total_starts,22)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l22,
    coalesce((lag(total_starts,23)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l23,
    coalesce((lag(total_starts,24)
    OVER (PARTITION BY subscription_platform ORDER BY Signup_month ASC)),0) AS total_starts_l24 
    
     from LTV_stg2
     order by 2,1
)

select 
subscription_platform,
sum( Subs_Retained_1) as  Subs_Retained_1,
sum( Subs_Retained_2) as  Subs_Retained_2,
sum( Subs_Retained_3) as  Subs_Retained_3,
sum( Subs_Retained_4) as  Subs_Retained_4,
sum( Subs_Retained_5) as  Subs_Retained_5,
sum( Subs_Retained_6) as  Subs_Retained_6,
sum( Subs_Retained_7) as  Subs_Retained_7,
sum( Subs_Retained_8) as  Subs_Retained_8,
sum( Subs_Retained_9) as  Subs_Retained_9,
sum( Subs_Retained_10) as  Subs_Retained_10,
sum( Subs_Retained_11) as  Subs_Retained_11,
sum( Subs_Retained_12) as  Subs_Retained_12,

sum( Subs_Retained_13) as  Subs_Retained_13,
sum( Subs_Retained_14) as  Subs_Retained_14,
sum( Subs_Retained_15) as  Subs_Retained_15,
sum( Subs_Retained_16) as  Subs_Retained_16,
sum( Subs_Retained_17) as  Subs_Retained_17,
sum( Subs_Retained_18) as  Subs_Retained_18,
sum( Subs_Retained_19) as  Subs_Retained_19,
sum( Subs_Retained_20) as  Subs_Retained_20,
sum( Subs_Retained_21) as  Subs_Retained_21,
sum( Subs_Retained_22) as  Subs_Retained_22,
sum( Subs_Retained_23) as  Subs_Retained_23,
sum( Subs_Retained_24) as  Subs_Retained_24 
from LTV_stg2
group by 1
UNION ALL

select 
subscription_platform,
sum( total_starts) as  total_starts,
sum( total_starts_l1) as  total_starts_l1,
sum( total_starts_l2) as  total_starts_l2,
sum( total_starts_l3) as  total_starts_l3,
sum( total_starts_l4) as  total_starts_l4,
sum( total_starts_l5) as  total_starts_l5,
sum( total_starts_l6) as  total_starts_l6,
sum( total_starts_l7) as  total_starts_l7,
sum( total_starts_l8) as  total_starts_l8,
sum( total_starts_l9) as  total_starts_l9,
sum( total_starts_l10) as  total_starts_l10,
sum( total_starts_l11) as  total_starts_l11,

sum( total_starts_l12) as  total_starts_l12,
sum( total_starts_l13) as  total_starts_l13,
sum( total_starts_l14) as  total_starts_l14,
sum( total_starts_l15) as  total_starts_l15,
sum( total_starts_l16) as  total_starts_l16,
sum( total_starts_l17) as  total_starts_l17,
sum( total_starts_l18) as  total_starts_l18,
sum( total_starts_l19) as  total_starts_l19,
sum( total_starts_l20) as  total_starts_l20,
sum( total_starts_l21) as  total_starts_l21,
sum( total_starts_l22) as  total_starts_l22,
sum( total_starts_l23) as  total_starts_l23

from LTV_stg3
group by 1
order by 1,2