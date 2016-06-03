#!/bin/sh

echo "Installing drupal to " . $DOCROOT

DATABASE_PASS="test"
cd $DOCROOT
ls -lah
drush dl drupal-7 --drupal-project-rename=drupal
mv drupal/* $DOCROOT
mv drupal/.htaccess $DOCROOT
rm -rf drupal
ln -s $ZENCI_DEPLOY_DIR sites/all/modules/travis_ci_drupal_module_example
drush --verbose site-install --db-url=mysql://test:@127.0.0.1/test --yes
drush --yes pm-enable simpletest
drush --yes pm-enable travis_ci_drupal_module_example
