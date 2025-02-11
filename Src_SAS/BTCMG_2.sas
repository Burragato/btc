
data BTCMG2;
   set BTCMG1;
   retain nday 0 ;
   if hour(timepart(time))=0 then nday=nday+1;
   %EMA( ema14d, 336, close );
   %EMA( ema21d, 504, close );
   %EMA( ema21dv, 504, volume );
   action="----";
   if ema14d > ema21d and close > ema14d then
           action='Buy';
   else if ema14d < ema21d or close < ema21d then
           action='Sell';
run;