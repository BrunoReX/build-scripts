#/usr/bin/env bash

# Change to match your setup

work_dir="C:\work"
lsm_dir="$work_dir\l-smash"
lsw_dir="$work_dir\L-SMASH-Works"
ffmpeg_dir="$work_dir\ffmpeg"
dist_dir="$work_dir\dist"

# Warning: the dist dir will be deleted every time you run this script!

if [ -d "$dist_dir" ]; then
  rm -rf "$dist_dir"
fi
mkdir "$dist_dir"

# Copying L-SMASH Files

cd "$work_dir\l-smash"

lsm_hash=$(git log -1 --format="%h")
lsm_rev=$(git rev-list HEAD | wc -l)

lsm_dist_name="L-SMASH_r$lsm_rev-g$lsm_hash"
lsm_dist="$dist_dir\\$lsm_dist_name"
if [ -d "$lsm_dist" ]; then
  rm -rf "$lsm_dist"
fi
mkdir "$lsm_dist"
mkdir "$lsm_dist\x64"
mkdir "$lsm_dist\x86"

cp "$lsm_dir\LICENSE" "$lsm_dist"
cp "$lsm_dir\build32\cli\boxdumper.exe" "$lsm_dist\x86"
cp "$lsm_dir\build32\cli\muxer.exe" "$lsm_dist\x86"
cp "$lsm_dir\build32\cli\remuxer.exe" "$lsm_dist\x86"
cp "$lsm_dir\build32\cli\timelineeditor.exe" "$lsm_dist\x86"
cp "$lsm_dir\build64\cli\boxdumper.exe" "$lsm_dist\x64"
cp "$lsm_dir\build64\cli\muxer.exe" "$lsm_dist\x64"
cp "$lsm_dir\build64\cli\remuxer.exe" "$lsm_dist\x64"
cp "$lsm_dir\build64\cli\timelineeditor.exe" "$lsm_dist\x64"

# Copying L-SMASH Works Files

cd "$work_dir\L-SMASH-Works"

lsw_hash=$(git log -1 --format="%h")
lsw_rev=$(git rev-list HEAD | wc -l)

lsw_dist_name="L-SMASH_Works_r$lsw_rev-g$lsw_hash"
lsw_dist="$dist_dir\\$lsw_dist_name"
if [ -d "$lsw_dist" ]; then
  rm -rf "$lsw_dist"
fi
mkdir "$lsw_dist"
mkdir "$lsw_dist\AviSynth"
mkdir "$lsw_dist\AviSynth\x64"
mkdir "$lsw_dist\AviSynth\x86"
mkdir "$lsw_dist\AviUtl"
mkdir "$lsw_dist\VapourSynth"
mkdir "$lsw_dist\VapourSynth\x64"
mkdir "$lsw_dist\VapourSynth\x86"

cp "$ffmpeg_dir\COPYING.LGPLv2.1" "$lsw_dist\FFMPEG_LICENSE"

cp "$lsw_dir\AviSynth\README" "$lsw_dist\AviSynth"
cp "$lsw_dir\AviSynth\LICENSE" "$lsw_dist\AviSynth"
cp "$lsw_dir\AviSynth\x64\Release\LSMASHSource.dll" "$lsw_dist\AviSynth\x64"
cp "$lsw_dir\AviSynth\Release\LSMASHSource.dll" "$lsw_dist\AviSynth\x86"

cp "$lsw_dir\AviUtl\LICENSE" "$lsw_dist\AviUtl"
cp "$lsw_dir\AviUtl\README" "$lsw_dist\AviUtl"
cp "$lsw_dir\AviUtl\README.ja" "$lsw_dist\AviUtl"
cp "$lsw_dir\AviUtl\build32\lwinput.aui" "$lsw_dist\AviUtl"
cp "$lsw_dir\AviUtl\build32\lwmuxer.auf" "$lsw_dist\AviUtl"
cp "$lsw_dir\AviUtl\build32\lwdumper.auf" "$lsw_dist\AviUtl"
cp "$lsw_dir\AviUtl\build32\lwcolor.auc" "$lsw_dist\AviUtl"

cp "$lsw_dir\VapourSynth\README" "$lsw_dist\VapourSynth"
cp "$lsw_dir\VapourSynth\LICENSE" "$lsw_dist\VapourSynth"
cp "$lsw_dir\VapourSynth\build32\vslsmashsource.dll" "$lsw_dist\VapourSynth\x86"
cp "$lsw_dir\VapourSynth\build64\vslsmashsource.dll" "$lsw_dist\VapourSynth\x64"

# Creating packages

cd "$dist_dir"
7z a -t7z -r "$lsm_dist_name.7z" "$lsm_dist_name/*"
7z a -t7z -r "$lsw_dist_name.7z" "$lsw_dist_name/*"