#!/bin/bash
ffmpeg -stream_loop 39 -i nebula_continuous_90s.mp4 -stream_loop 6 -i deep_cinematic_10min.mp3 -c:v libx264 -preset fast -crf 26 -r 12 -c:a aac -b:a 128k -shortest -pix_fmt yuv420p -movflags +faststart Deep_Sleep_1_Hour.mp4
