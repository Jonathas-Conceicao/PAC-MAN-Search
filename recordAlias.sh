RECORD=ffmpeg -video_size 660x396 -framerate 25 -f x11grab -i :0.0+1,1 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p /tmp/record.mp4 -y && ffmpeg -i /tmp/record.mp4 /tmp/record.gif -hide_banner -y

CONVERT=ffmpeg -i /tmp/record.mp4 /tmp/record.gif -hide_banner -y

AND_PRINT=& sleep 1;import -window root /tmp/tmp.png -crop 630x515+1+1
