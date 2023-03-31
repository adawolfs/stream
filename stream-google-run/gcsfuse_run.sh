#!/usr/bin/env bash
set -eo pipefail
mkdir -p $MNT_DIR
chown -R www-data:www-data $MNT_DIR
chmod 777 -R $MNT_DIR

echo "mounting-gcs-fuse"
gcsfuse --dir-mode 777 --file-mode 777 --debug_gcs --debug_fuse  $BUCKET $MNT_DIR 
echo "mounting-has-been-completed"



# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- apache2-foreground "$@"
fi
exec "$@"