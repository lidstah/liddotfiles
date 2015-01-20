#!/bin/bash
# dzen ratpoison stats - based on my status.sh for wmfs

MBOX=/home/lidstah/Mail/mbox/new
RX_PAST=0
TX_PAST=0
INFOS=`uname -nr`
DR_WHO=`whoami`
while true;
do
	# Network stats (lazy job)
	RX_FILE=`cat /sys/class/net/eth0/statistics/rx_bytes`
	RX_ACTUAL=$(echo "$RX_FILE/1024"|bc)
	# warning, you'll have to adjust RX_SPEED to your sleep value (eg, if it's 2, $(echo "($RX_ACTUAL-$RX_PAST)/2"|bc -l shall do the job. And so on...
	RX_SPEED=$(echo "($RX_ACTUAL-$RX_PAST)/5"|bc)
	RX_PAST=$RX_ACTUAL
	# we don't need to bloat the statusbar with 20 digits...7 digits shall be enough (Kib/sec, so up to 999999 Kib/sec, which is imho sufficient :) )
	RX_VALUE=`echo ${RX_SPEED:0:6}`
	# Of course, we do the same for tx
	TX_FILE=`cat /sys/class/net/eth0/statistics/tx_bytes`
	TX_ACTUAL=$(echo "$TX_FILE/1024"|bc)
	# same warning as for RX_SPEED
	TX_SPEED=$(echo "($TX_ACTUAL-$TX_PAST)/5"|bc)
	TX_PAST=$TX_ACTUAL
	# Of course, we still don't need to bloat the statusbar :)
	TX_VALUE=`echo ${TX_SPEED:0:6}`
	METEO=`cat /tmp/weather.txt`
	DATE=`date`
#       UPTIME=`uptime | sed s/............//`
	UPTIME=`uptime | awk '{print $3 $4}' | sed s/\ays,//`
	LOAD=`uptime | awk '{print $(NF-2) $(NF-1) $NF}'`
        MPD=`mpc | head -n1`    
	MPC=`mpc | grep playing | sed 's/.........//'`
	MEM=`free | grep buffers/cache | awk '{print $4}'` 
	VOL=`aumix -q | grep vol | awk {'print $3'}`
	MAIL=`ls -l $MBOX | grep $HOSTNAME | wc -l`
	echo "[^i(/home/lidstah/icons/xbm8x8/fs_02.xbm)^fg(#f0dfaf) "$METEO"^fg()][^i(/home/lidstah/icons/xbm8x8/net_down_03.xbm) ^fg(#94bff3)"$RX_VALUE"^fg()Kio/s][^i(/home/lidstah/icons/xbm8x8/net_up_03.xbm) ^fg(#c3bf9f)"$TX_VALUE"^fg()Kio/s][^i(/home/lidstah/icons/xbm8x8/note.xbm) ^fg(#94bff3)"$MPD $MPC"^fg(#dca3a3) ^ca(1,mpc --no-status prev)^i(/home/lidstah/icons/xbm8x8/prev.xbm)^ca() ^ca(1,mpc --no-status toggle)^i(/home/lidstah/icons/xbm8x8/pause.xbm)^ca() ^ca(1,mpc --no-status next)^i(/home/lidstah/icons/xbm8x8/next.xbm)^ca()^fg()][^i(/home/lidstah/icons/xbm8x8/cpu.xbm) ^fg(#f0dfaf)"$LOAD"^fg()][^i(/home/lidstah/icons/xbm8x8/mem.xbm) ^fg(#f0dfaf)" $MEM"^fg()Kio free][^i(/home/lidstah/icons/xbm8x8/spkr_01.xbm) ^fg(#f0dfaf)"$VOL"^fg()%][^i(/home/lidstah/icons/xbm8x8/mail.xbm) ^fg(#dca3a3)"$MAIL"^fg()][^i(/home/lidstah/icons/xbm8x8/clock.xbm) ^fg(#f0dfaf)"$DATE"^fg()][^i(/home/lidstah/icons/xbm8x8/arch.xbm)^fg(#dca3a3) "$DR_WHO"@"$INFOS"^fg()][^fg(#dca3a3)^i(/home/lidstah/icons/xbm8x8/cat.xbm) "$UPTIME"^fg()]" 
	sleep 5
done
