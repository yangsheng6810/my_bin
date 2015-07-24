for file in *.tak; do
    mkdir 1
    echo $file;
    filename=`basename "$file" .tak`;
    echo $filename;
    wine ~/down/software/Linux/tak/Applications/Takc.exe -d "${filename}.tak" - | flac -8 - -o "${filename}.flac";
    sed "s/${filename}.tak/${filename}.flac/" "${filename}.cue" > 1.cue
    cue2tracks -c flac -f gbk -o "./1/%A/%N-%t" 1.cue
    # rm *.flac
    # rm 1.cue
    # mv ./1/* ~/Musics/Tracks/white\ album
    # rmdir 1
done
