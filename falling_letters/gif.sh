#!/bin/sh

ffmpeg -i out/%03d.png -vf fps=20,scale=720:-1 out/out.gif
rm out/*.png