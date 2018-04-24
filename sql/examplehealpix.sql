/*select t0.idrings
      ,count(*)
  from (select id
      ,datapoints
      ,avg_ra as "ra [rad]"
      ,avg_dec "dec [rad]"
      ,ang2pix(2097152, pi()/2 - avg_dec, avg_ra) as idrings
  from runcat ) t0
--where id between 2359 and 2368
group by t0.idrings
having count(*) > 2
;
*/
select * 
  from (
select id
      ,datapoints
      ,avg_ra as "ra [rad]"
      ,avg_dec "dec [rad]"
      ,avg_ra_deg
      ,avg_dec_deg
      ,ang2pix(2097152, pi()/2 - avg_dec, avg_ra) as idrings
  from runcat 
  ) t0
 where idrings = 1881303359199
order by avg_dec_deg
;

