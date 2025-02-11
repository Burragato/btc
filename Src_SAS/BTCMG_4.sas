
data BTCMG4;
   set BTCMG3;
   %EMA( ema14s, 2352, close );
   %EMA( ema21s, 3528, close );
   actions="----";
   if ema14s > ema21s and close > ema14s then
      actions='Buy';
   else if ema14s < ema21s and close < ema14s then
      actions='Sell';
run;