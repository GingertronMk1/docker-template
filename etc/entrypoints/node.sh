#!/bin/bash

# copy from the image backup location to the volume mount
echo "Synchronizing node_modules files to /src/"
rsync -a /src/cache/node_modules /src/
echo "Synchronized node_modules files"

# run PHP server
exec npm run watch
