
proc means data=se noprint;
   output out=mse mean(se)=mse sum(e)=se
                       mean(sef)=msef sum(ef)=sef;
   where nday>1790;
run;



data controllo; set se; where se ne sef; run;