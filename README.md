# profedex-api

PHP, MySQL

Clone repository
```
git clone https://github.com/lgos44/profedex-api
```

Install Composer: https://getcomposer.org/download/
```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
```

Install Slim3, inside profedex-api, run:
```
composer require slim/slim "^3.0"
```

Load database dump
```
mysql -u root -p profedex < profedexdump.sql
```

Run PHP server from profedex-api/public:
```
php -S localhost:1234
```
