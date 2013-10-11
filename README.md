Artisan Anywhere
================

### Execute Artisan from anywhere in your Laravel project tree

Let's suppose you went for a walk down the Illuminate tree and, being in `/var/www/laravel/vendor/laravel/framework/src/Illuminate/Database/Console/Migrations`, you decided tinker to test some stuff, well... you have some options:

```
php ../../../../../../../../artisan tinker

php /var/www/laravel artisan tinker

cd /var/www/laravel ; php artisan tinker
```

or just

```
artisan tinker
```

What do you prefer?

#### Installation

You can just download the raw file to your /usr/bin and make it executable

```
sudo wget -q -O test \
 https://raw.github.com/antonioribeiro/artisan-anywhere/master/artisan.sh \
 /usr/bin/artisan

sudo chmod 755 /usr/bin/artisan
```

or clone the repo and link it

```
sudo git clone https://github.com/antonioribeiro/artisan-anywhere.git /etc/laravel-anywhere

sudo ln -s /etc/laravel-anywhere/artisan.sh /usr/bin/artisan

sudo chmod 755 /usr/bin/artisan
```
