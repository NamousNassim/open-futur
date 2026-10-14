#!/usr/bin/env bash
# Builds open-futur.zip, ready to upload with the cPanel File Manager.
set -euo pipefail
cd "$(dirname "$0")"

BUILD=build/open-futur
rm -rf build && mkdir -p "$BUILD"

rsync -a ./ "$BUILD"/ \
    --exclude build --exclude node_modules --exclude vendor --exclude .git \
    --exclude .env --exclude 'database/database.sqlite' \
    --exclude 'storage/logs/*.log' --exclude 'storage/framework/sessions/*' \
    --exclude 'storage/framework/views/*.php' --exclude 'storage/framework/cache/data/*'

composer install --working-dir="$BUILD" --no-dev --optimize-autoloader --no-interaction --quiet

cp .env.production.example "$BUILD/.env"
php "$BUILD/artisan" key:generate --force --quiet

(cd build && python3 -m zipfile -c open-futur.zip open-futur)
echo "Created build/open-futur.zip"
