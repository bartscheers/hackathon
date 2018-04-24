select t0.idrings
      ,count(*)
  from (select id
      ,datapoints
      ,avg_ra as "ra [rad]"
      ,avg_dec "dec [rad]"
      ,ang2pix(%(nside)s, pi()/2 - avg_dec, avg_ra) as idrings
  from runcat ) t0
group by t0.idrings
;
