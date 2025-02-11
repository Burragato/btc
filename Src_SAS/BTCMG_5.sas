
* Calcolo medie settimanali a 14 e 21 settimane;

data B4ds.BTCMG5;

   retain action ema14s ema21s;
   set B4ds.BTCMG4;
   retain overall_gains 100 overall_gains_netto 100 buy_prices 0 sell_prices;
   retain overall_gains2 100 overall_gains2_netto 100;
   l_actions=lag(actions);

   if nday>1790 then do;                                

	      if actions='Buy' and l_actions ne 'Buy' then do;
         buy_prices=close;
      end;
      else if actions ne 'Buy' and l_actions eq 'Buy' then do;
         buy_gains=(close-buy_prices)/buy_prices*100;
         buy_prices=.;
         overall_gains=overall_gains*(1+buy_gains/100);
         * Attenzione le commissioni sono del 2% tra acquisto e vendita;         
         overall_gains_netto=overall_gains_netto*(1+buy_gains/100-0.02);
      end;
           	      if actions='Buy' and l_actions ne 'Buy' then do;
         		buy_prices=close;
      	      end;
      	      else if actions ne 'Buy' and l_actions eq 'Buy' then do;
        		 buy_gains=(close-buy_prices)/buy_prices*100;
         		*buy_prices=.;
           		overall_gains2=overall_gains2*(1+buy_gains/100);
         	     * Attenzione le commissioni sono del 2% tra ascquisto e vendita;         
         		overall_gains2_netto=overall_gains2_netto*(1+buy_gains/100-0.02);
                 end;
* Acquisti in short;

  if actions='Sell' and l_actions ne 'Sell' then do;
             sell_prices=close;
   end;
   else if actions ne 'Sell' and l_actions eq 'Sell' then do;
              sell_gains=(sell_prices-close)/sell_prices*100;
              sell_prices=.;
              overall_gains=overall_gains*(1+sell_gains/100);
         * Attenzione le commissioni sono del 2% tra acquisto e vendita;         
             overall_gains_netto=overall_gains_netto*(1+sell_gains/100-0.02);
   end;
   end; 

run;                               
