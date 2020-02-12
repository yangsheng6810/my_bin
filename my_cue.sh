for file in *.tak; do
    mkdir 1
    echo $file;
    filename=`basename "$file" .tak`;
    echo $filename;
    wine ~/bin/tak/Applications/Takc.exe -d "${filename}.tak" - | flac -8 - -o "${filename}.flac";
    # ffmpeg -i "${filename}.tak" "${filename}.flac"
    # if [ ! -f "${filename}.cue" ]; then
    #     ffmpeg -i "${filename}.tak" -f ffmetadata 1.txt
    #     tak_cue.py 1.txt "${filename}"
    # fi
    # wine ~/bin/tak/Applications/Takc.exe -d "${filename}.tak"
    # takc -d "${filename}.tak"
    # sed "s/${filename}.tak/${filename}.wav/" "${filename}.cue" > 1.cue
    sed "s/${filename}.tak/${filename}.flac/" "${filename}.cue" > 1.cue
    cue2tracks -c flac -f gbk -o "./1/%A/%N-%t" 1.cue
    # rm *.flac
    # rm 1.cue
    # mv ./1/* ~/Musics/Tracks/white\ album
    # rmdir 1
done
