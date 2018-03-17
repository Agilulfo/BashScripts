#!/bin/sh
echo -n "Il nome del file senza estensione "
read NOMEFILE
# ls -l $NOMEFILE


#echo -n "La durata in minuti (o solo invio per indefinita) "
#read MINUTI

#SECONDI=$((60 * $MINUTI))
#echo "Secondi "$SECONDI
#if [ ${SECONDI} -eq 0 ]
#then
#   FINE_REC=""
#else
#   FINE_REC=" -endpos "$SECONDI
#fi
# echo $FINE_REC

mencoder tv:// -tv \
driver=v4l2:input=0:norm=pal-i:width=720:height=576:outfmt=yuy2\
:device=/dev/video1:forceaudio:audiorate=48000:alsa:adevice=hw.2,0:buffersize=128 \
-ovc lavc -lavcopts vcodec=mpeg4:vbitrate=5000:keyint=30 \
-oac mp3lame -lameopts br=128:cbr -ffourcc divx -noskip -o $NOMEFILE.avi
vlc $NOMEFILE.avi

