#!/bin/sh

echo "Installing drupal to " . $DOCROOT

DATABASE_PASS="test"
cd $DOCROOT

drush dl drupal-7 --drupal-project-rename=drupal
mv drupal/* $DOCROOT
mv drupal/.htaccess $DOCROOT
rm -rf drupal
ln -s $ZENCI_DEPLOY_DIR $DOCROOT/sites/all/modules/travis_ci_drupal_module_example
drush -r $DOCROOT --verbose site-install --db-url=mysql://test:@127.0.0.1/test --yes
drush -r $DOCROOT --yes pm-enable simpletest
drush -r $DOCROOT --yes pm-enable travis_ci_drupal_module_example
