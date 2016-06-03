#!/bin/sh
SITEPATH="$HOME/www"

echo "Full site path: $SITEPATH"
cd $SITEPATH
ls -lah
php $SITEPATH/scripts/run-tests.sh --php "/usr/bin/php" --verbose --color --url http://127.0.0.1 --class "TravisDrupalModuleExampleDrupalUnitTestCase"
