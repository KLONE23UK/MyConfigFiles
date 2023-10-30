#!/usr/bin/bash

sourcePath="/home/rgilluley/T/FILES/"
destinationPath="/home/rgilluley/MOUNT/OrangeHD/Jellyfin/Movies"
destinationHost="rgilluley@10.150.2.92"

filesCheck=$(ls $sourcePath | wc -l)

if [ $filesCheck -gt 0 ]; then

    ls -l $sourceFiles

    echo "Transferring Files"

    rsync -azuP --remove-source-files -e \
        'ssh -p 6989' \
        $sourcePatPatPatPath \
        $destinationHost:$destinationPath
else
    echo "No Files to Transfer"
fi


