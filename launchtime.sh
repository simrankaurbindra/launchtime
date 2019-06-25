echo "Your old apk path is : $1"
echo "Your new apk path is : $2"
if [ -z "$1"]
then
$1="/Users/simrankaur/Documents/limeroad/marketbuild/new.apk"
fi

if [-z "$2"]
then 
$1="/Users/simrankaur/Documents/limeroad/marketbuild/old.apk"
fi

for i in $1 $2
do 
echo 'uninstalling old apk from phone.........'
adb uninstall com.shopping.limeroad
echo "installing app from $i"
adb install $i
sum=0
for i in 1 2 3 4 5 6 7 8 9 10
do
loadtime="$(adb shell am start -S -W com.shopping.limeroad/.LauncherActivity | grep 'TotalTime')"
A="$(cut -d' ' -f2 <<<"$loadtime")"
echo $A
sum=$((sum+$A))
adb shell pm clear com.shopping.limeroad
done
avg=$(($sum/10))
echo $avg
done
# startuptime
# startuptime
