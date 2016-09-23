#!/bin/bash

for dir in /var/www/html/*/; do
	schoolcode=${dir%*/}
	schoolcode=${schoolcode: 14}

	chown -R www-data:www-data /var/www/html/$schoolcode/sites/default/files

	twit \
		/srv/templates/vhost.conf.tpl \
		/etc/apache2/sites-enabled/$schoolcode.conf \
		-p '{"schoolcode": '"\"$schoolcode\""'}' \
		--no-escape

	twit \
		/srv/templates/settings.php.tpl \
		/var/www/html/$schoolcode/sites/default/settings.php \
		-p '{"schoolcode": '"\"$schoolcode\""'}' \
		--no-escape
done

exec "$@"
