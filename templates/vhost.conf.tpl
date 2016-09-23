<VirtualHost *:80>
    DocumentRoot "/var/www/html/{{ .schoolcode }}"
    ServerName {{ .schoolcode }}.schools.dev

    <Directory /var/www/html/{{ .schoolcode }}/>
        Options FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>
</VirtualHost>
