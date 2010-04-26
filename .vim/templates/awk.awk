#! /usr/bin/awk -f
{
   start = sprintf("\\+%s\\+", pattern)
   stop  = sprintf("\\-%s\\-", pattern)

   if ($0 ~ start) {
      good = 1;
   }
   else if ($0 ~ stop) {
      good = 0;
   }
   else if(good == 1) {
      print $0
   }
}
