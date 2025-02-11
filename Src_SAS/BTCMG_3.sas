
data BTCMG3;
   retain action ema14d ema21d ema21dv vol24h;
   set BTCMG2;
   retain overall_gain 100 overall_gain_netto 100 buy_price 0;
   if nday>1790 then do;
      if action='Buy' and lag(action) ne 'Buy' then do;
         buy_price=close;
      end;
      else if action ne 'Buy' and lag(action) eq 'Buy' then do;
         buy_gain=(close-buy_price)/buy_price*100;
         buy_price=.;
         overall_gain=overall_gain*(1+buy_gain/100);
         overall_gain_netto=overall_gain_netto*(1+buy_gain/100-0.02);
      end;
   end; 
run;
