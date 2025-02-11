

data se;
   set BTCMG5;
   lag_close=lag(close);
   if nday>1790 and lag(action)='Buy' then do;
      close_forecast=lag_close+1.92;
   end;
   else close_forecast=lag_close;
   e=close-lag_close;
   ef=close-close_forecast;
   se=abs(close-lag_close)**2;
   sef=abs(close-close_forecast)**2;
run;