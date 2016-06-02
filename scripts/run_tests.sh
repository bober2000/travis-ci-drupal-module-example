#!/bin/sh
SITEPATH="$HOME/www"

echo "Full site path: $SITEPATH"
cd $SITEPATH

php scripts/run-tests.sh --php "/usr/bin/php" --verbose --color --url http://http://127.0.0.1 --class "TravisDrupalModuleExampleDrupalUnitTestCase"
