ffmpeg -i $1 -ss $2 -t $3 -async 1 -strict -2 cut_vid.mp4

mkdir frames
ffmpeg -i cut_vid.mp4 -r "1" "frames/f_%03d.png"
ffmpeg -r "55" -i "frames/f_%03d.png" -vcodec "libx264" -crf "0" output-crf0.mjpeg
rm -rf frames
rm cut_vid.mp4
