Laravel Artisan Anywhere
========================

### TLDR;

This script will recursively look for the artisan command down the directory tree and execute it for you, no matter where you are in the project tree. So, being up in the tree and typing

``` text
$ artisan
```

It should

``` text
$ artisan
Artisan found at /Users/antoniocarlosribeiro/code/pragmarx/pragmarx.com/artisan
Laravel Framework 5.5.28

Usage:
  command [options] [arguments]

...
```

Using artisan normally, it could be be equivalent to execute

```
$ php ../../../../../../../../artisan
```

### Execute Artisan from anywhere in your Laravel project tree

Let's suppose you went for a walk, far down the Illuminate tree and, being in 

```
/var/www/laravel/vendor/laravel/framework/src/Illuminate/Database/Console/Migrations, 
```

you need to run tinker, to test some stuff. Well... you have some options:

```
php ../../../../../../../../artisan tinker

php /var/www/laravel artisan tinker

cd /var/www/laravel ; php artisan tinker
```

or just

```
artisan tinker
```

#### Installation

You can just download the raw file to your /usr/bin and make it executable

```
sudo wget -q -O /usr/local/bin/artisan \
 https://raw.github.com/antonioribeiro/artisan-anywhere/master/artisan.sh

sudo chmod 755 /usr/local/bin/artisan
```

or clone the repo and link it

```
sudo git clone https://github.com/antonioribeiro/artisan-anywhere.git /etc/laravel-anywhere

sudo ln -s /etc/laravel-anywhere/artisan.sh /usr/local/bin/artisan

sudo chmod 755 /usr/local/bin/artisan
```

#### Contributing

Pull requests and issues are more than welcome.
