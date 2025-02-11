

proc import 
datafile="/data/BTC_SAS/BTC-USD_data_from_2016-07-01-01-00_to_Now.xlsx"
dbms=xlsx
out=btc replace;

run;


data BTCMG1;
     set BTC;
     keep time close volume ma50d max10d min10d stddev24h vol24h vol4h;
run;