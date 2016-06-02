#!/bin/sh

echo "Installing drupal to " . $DOCROOT

DATABASE_PASS="test"
cd $DOCROOT

drush dl drupal-7 --drupal-project-rename=drupal
mv drupal/* .
mv drupal/.htaccess .
rm -rf drupal
ln -s $ZENCI_DEPLOY_DIR sites/all/ZENCI_REPO_NAME
drush --verbose site-install --db-url=mysql://$DATABASE_USER:$DATABASE_PASS@127.0.0.1/$DATABASE_NAME --yes
#drush site-install standard -y --root=$DOCROOT --account-mail=admin@$DOMAIN --uri=http://$DOMAINNAME --site-name=$SITENAME --site-mail=$SITEMAIL --db-url=mysql://$DATABASE_USER:$DATABASE_PASS@localhost/$DATABASE_NAME