
data avg_gain;
   set BTCMG5;
   close_diff_buy=.; close_diff_sell=.;
   close_diff=(close-lag(close)); */lag(close);
   if lag(action)='Buy' then do;
      close_diff_buy=close_diff;
   end;
   if lag(action)='Sell' then do;
      close_diff_sell=close_diff;
   end;
run;




proc means data=avg_gain noprint;
   output out=avg_gain_tot mean(close_diff_buy)=close_diff_buy 
                                N(close_diff_buy)=N_close_diff_buy 
                                mean(close_diff_sell)=close_diff_sell
                                N(close_diff_sell)=N_close_diff_sell;
   where nday>1790;
run;
