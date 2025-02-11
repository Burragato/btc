

%MACRO EMA( VARIND, NG, VARNAME ); 

/* Esponential moving average a NG giorni */

   retain l&VARIND 0;
   if nday<2 or l&VARIND=. then
      &VARIND=&VARNAME;
   else
      &VARIND=&VARNAME*(2/(&NG+1))+l&VARIND*(1-(2/(&NG+1)));
   l&VARIND=&VARIND;
   drop l&VARIND;

%MEND;