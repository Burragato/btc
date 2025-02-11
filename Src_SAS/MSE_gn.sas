

data BTCMG5_gn;
   set BTCMG5;
   if hour(timepart(time))=0;
run;



data se_gn;
   set BTCMG5_gn;
   lag_close=lag(close);
   if nday>1790 and lag(action)='Buy' then do;
      close_forecast=lag_close+1.92*24;
   end;
   else close_forecast=lag_close;
   e=close-lag_close;
   ef=close-close_forecast;
   se=abs(close-lag_close)**2;
   sef=abs(close-close_forecast)**2;
run;



proc means data=se_gn noprint;
   output out=mse_gn mean(se)=mse sum(e)=se
                          mean(sef)=msef sum(ef)=sef;
   where nday>1790;
run;