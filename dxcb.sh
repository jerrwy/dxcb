ljnum=0
cjnum=0
while true
do
  ljnum=$[$ljnum+1]
  sleep 0.1
  echo 炼金*$ljnum
  adb shell input tap 220 340
  
  second=$((10#$(date +%S)))
  
  #每隔5s点击一次同意
  if [ $(( $second % 5 )) -eq 0 ]; then
   adb shell input tap 520 1130
  fi
  
  #每隔30s采集一次
  if [ $second -eq 30 -o $second -eq 0 ]; then
    cjnum=$[$cjnum+1]
    echo 采集*$cjnum
    adb shell input tap 1000 125
    adb shell input tap 200 525
    adb shell input tap 100 125
  fi
done
