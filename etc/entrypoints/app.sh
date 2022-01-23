#!/bin/bash

# copy from the image backup location to the volume mount
echo "Synchronizing vendor files to /src/"
rsync -a /src/cache/vendor /src/
echo "Synchronized vendor files"

# run PHP server
exec php artisan serve --host=0.0.0.0 --port=8000 &
     php artisan queue:work &
     php artisan schedule:work
