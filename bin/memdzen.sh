 #2007 by Robert Manea
 #
 # Left mouse button toggles detailed view
 # Right mouse button quits
  
 #--[ Configuration ]---------------------------------------------------
  
 # bg color
 BG='#494b4f'
 # fg color
 FG='grey70'
 # font
# FNT='-*-profont-*-*-*-*-11-*-*-*-*-*-iso8859'
 # x position
 XPOS=1435
 # y position
 YPOS=0
 # title width
 TWIDTH=125
 # details area width
 DWIDTH=150
  
 # events & actions
 ACT='button1=togglecollapse;button3=exit'
  
  
 #----------------------------------------------------------------------
  
 AWKS='/MemTotal/   {mtotal=$2};
 /MemFree/    {mfree=$2};
 /Active/     {mactive=$2};
 /^Cached/     {mcached=$2};
 /SwapTotal/  {swtotal=$2};
 /SwapFree/   {swfree=$2};
 END {
     print mtotal-mfree " " mtotal;
         print mactive " " mtotal;
	     print mcached " " mtotal;
	         print swtotal-swfree " " swtotal; }'
		  
		 while echo ' ^tw()Mem:
			 Active:
			 Cached:
			 Swap  : ' | paste -d ' ' - <(awk "$AWKS" /proc/meminfo | gdbar -fg '#aecf96' -bg '#37383a' -w 50 -h 7); do
			 sleep 5
		 done | dzen2 -ta l -l 3 -bg $BG -fg $FG -x $XPOS -y $YPOS -tw $TWIDTH -w $DWIDTH -sa c -e $ACT
