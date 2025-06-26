#!/bin/bash

# gif-video-converter.sh
# Converts input MP4 into multiple GIF versions (email, web, mid), and high-quality video outputs
# Requires: ffmpeg

INPUT_FILE="$1"
FILENAME=$(basename -- "$INPUT_FILE")
BASENAME="${FILENAME%.*}"
DIRNAME=$(dirname "$INPUT_FILE")

# ----------------------------
# Define Output File Paths
# ----------------------------
GIF_EMAIL="$DIRNAME/${BASENAME}_email.gif"
GIF_MID="$DIRNAME/${BASENAME}_mid.gif"
GIF_WEB="$DIRNAME/${BASENAME}_web.gif"

MP4_WEB="$DIRNAME/${BASENAME}_web.mp4"
MP4_MID="$DIRNAME/${BASENAME}_mid.mp4"
MP4_EMAIL="$DIRNAME/${BASENAME}_email.mp4"

# ----------------------------
# Helper Function for GIF
# ----------------------------
make_gif() {
  FPS=$1
  SCALE=$2
  COLORS=$3
  DITHER=$4
  OUT_GIF=$5
  PALETTE="$DIRNAME/palette_${RANDOM}.png"

  ffmpeg -y -i "$INPUT_FILE" -vf "fps=$FPS,scale=$SCALE:-1:flags=lanczos,palettegen=max_colors=$COLORS" -frames:v 1 "$PALETTE"
  ffmpeg -y -i "$INPUT_FILE" -i "$PALETTE" -lavfi "fps=$FPS,scale=$SCALE:-1:flags=lanczos[x];[x][1:v]paletteuse=dither=$DITHER:bayer_scale=5" "$OUT_GIF"
  rm "$PALETTE"
}

# ----------------------------
# Generate GIFs
# ----------------------------
# Email: smallest, <1.5MB
make_gif 8 380 32 bayer "$GIF_EMAIL"

# Mid: slightly better clarity
make_gif 10 500 64 bayer "$GIF_MID"

# Web: decent quality
make_gif 15 600 128 floyd_steinberg "$GIF_WEB"

# ----------------------------
# Generate High-Quality MP4s
# ----------------------------
# Using H.264 and faststart for web-ready playback
ffmpeg -y -i "$INPUT_FILE" -movflags faststart -pix_fmt yuv420p -vf "scale=380:-2,fps=24" "$MP4_EMAIL"
ffmpeg -y -i "$INPUT_FILE" -movflags faststart -pix_fmt yuv420p -vf "scale=500:-2,fps=30" "$MP4_MID"
ffmpeg -y -i "$INPUT_FILE" -movflags faststart -pix_fmt yuv420p -vf "scale=600:-2,fps=60" "$MP4_WEB"

# ----------------------------
# Done!
# ----------------------------
echo "Conversion complete!"
echo "GIFs:"
echo "  Email  => $GIF_EMAIL"
echo "  Mid    => $GIF_MID"
echo "  Web    => $GIF_WEB"
echo "MP4s:"
echo "  Email  => $MP4_EMAIL"
echo "  Mid    => $MP4_MID"
echo "  Web    => $MP4_WEB"
