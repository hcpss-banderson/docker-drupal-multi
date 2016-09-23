#!/bin/bash

for dir in /var/www/html/*/; do
	schoolcode=${dir%*/}
	schoolcode=${schoolcode: 14}

	chown -R www-data:www-data /var/www/html/$schoolcode/sites/default/files

	twit \
		/srv/templates/vhosts.conf.tpl \
		/etc/apache2/sites-available/$schoolcode.conf \
		-p '{"schoolcode": '"\"$schoolcode\""'}'

	twit \
		/srv/templates/settings.php.tpl \
		/var/www/html/$schoolcode/sites/default/settings.php \
		-p '{"schoolcode": '"\"$schoolcode\""'}'

done

exec "$@"
