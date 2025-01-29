#!/system/bin/sh

while [ "$(getprop sys.boot_completed)" != 1 ]; do
  sleep 3
done

for i in $(ps -A | grep init | grep subcontext | awk '{print $1}'); do
    echo -1000 > /proc/$i/oom_score_adj
    echo -17 > /proc/$i/oom_adj
done

# Logging
echo "Lag fix applied at $(date)" > /data/media/magisklagfix.log
