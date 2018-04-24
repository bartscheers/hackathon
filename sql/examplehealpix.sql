select id
      ,datapoints
      ,avg_ra as "ra [rad]"
      ,avg_dec "dec [rad]"
      ,ang2pix(8, pi()/2 - avg_dec, avg_ra) as ipnest
  from runcat 
 where id between 2359 and 2368
;
