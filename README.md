# README
Данная инструкция предназначена для облегчения настройки деплоя на сервер и понимания сотрудников, как работает деплой.
# Настройка сервера
На сервере стоит Ubunta 16+ 

 1. **Установка mysql**
	- [search](https://www.google.ru/search?q=mysql+install+ubuntu&oq=mysql+install+ubu&aqs=chrome.0.0j69i57j0l4.9128j0j7&client=ubuntu&sourceid=chrome&ie=UTF-8)
	- [link](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-16-04)
	- command
		- `sudo apt-get update`
		- `sudo apt-get install mysql-server`
		- `mysql_secure_installation`
		- `systemctl status mysql.service`
 2. **Настройка Mysql**
	 - [search](https://www.google.ru/search?newwindow=1&client=ubuntu&hs=OXN&ei=g6JVXYi9Jc-XmwW255SgCA&q=mysql+add+user&oq=mysql+add+&gs_l=psy-ab.3.0.0i203l3j0l5j0i203j0.500513.501161..502106...0.0..0.219.581.4j0j1......0....1..gws-wiz.......0i71j35i39j0i67.GfH4zq7qUDw)
	 - [link](https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql)
	 - Заходим в БД
		 - `mysql -u root -p`
	 - Смотрим, какие юзеры есть
		 - `SELECT User FROM mysql.user;`
	 - Создаем нового юзера
		 - `CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';`
	 - Смотрим какие есть БД
		 - `SHOW DATABASES;`
	 - Создаем новую БД
		 - `CREATE DATABASE database name;`
	 - Даем новому юзеру права на новую БД
		 - `GRANT ALL PRIVILEGES ON database_name.* TO 'database_user'@'localhost';`
 
 **Работа с БД завершена**

1. **Устанавливаем curl**
	  -  `sudo apt-get update && sudo apt-get install curl`

**==**
1. **Ставим NodeJs**    
	- Переходим в корень cd ~
	- Качаем файл `curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh`
	- Запускаем `sudo bash nodesource_setup.sh`
	- Инсталлируем `sudo apt install nodejs`
	- Проверяем `node -v`
2. **Ставим node-sass если в проекте есть saas**
	- `sudo apt-get install ruby-full build-essential rubygems`
	- `sudo gem install sass`
	- `sudo apt-get install ruby-sass`
	- `sudo gem install compass`
	- `npm install -g sass`
	- `npm rebuild node-sass`

**Работа с node завершена**
1. **Ставим в проект php**
	- Устанавливаем ссылки на ppa
		- `sudo add-apt-repository ppa:ondrej/php`
		- `sudo apt-get update`
2.  **Ставим зависимости php на сервере**
	- `sudo apt install php7.2 php7.2-fpm  php7.2-opcache php7.2-zip php7.2-xmlrpc php7.2-xsl php7.2-mbstring php7.2-mysql php7.2-odbc php7.2-pgsql php7.2-pspell php7.2-readline php7.2-recode php7.2-snmp php7.2-soap php7.2-sqlite3 php7.2-sybase php7.2-tidy php7.2-xml php7.2-json php7.2-ldap php7.2-intl php7.2-interbase php7.2-imap php7.2-gmp php7.2-gd php7.2-enchant php7.2-dba php7.2-bz2 php7.2-bcmath php7.2-phpdbg php7.2-cgi php7.2-cli php7.2-curl`

**Работа по php завершены**
1. **Ставим в проекте composer**
	  - Устанавливаем composer
		  - `sudo curl -s https://getcomposer.org/installer | php`
		 - `sudo mv composer.phar /usr/local/bin/composer`

**Работа завершены**

1. **Устанавливаем git**
		  - `sudo apt install git`

1. **Устанавливаем nginx**
	- `sudo apt update && sudo apt install nginx`
	 
# Работа с пользователем
1.  **Добавляем нового пользователя и кладем его в группу с sudo**
	  - Добавляем нового пользователя
	    - `adduser username`
	  - Указываем пароль и везде жмем enter
	  - Добавляем в группу
	    - `usermod -aG sudo username`
	  - Проверяем все ли работает
	    - `su - username`
	  - Смотрим содержимое root папки 
	    - `root sudo ls -la /root`
2.  **Делаем судо без пароля**
	  - Делаем бекап настроек
	    - `sudo cp /etc/sudoers /root/sudoers.bak`
	  - Редактируем файл sudo vim sudoers. В самый конец добавляем строку: 
		  - `username ALL=(ALL) NOPASSWD:ALL`
	  - Проверяем
		  - `sudo /etc/init.d/nginx restart`
3. **Работа с пользователем завершена**

# Настройка доступа по ssh
1. Нам надо подключаться к этому серверу по ssh без пароля от нового пользователя, чтобы в дальнейшем перенести это на circle
	-  Генерим новый ssh у себя на компе
		- `ssh-keygen`    
	- При генерации выбираем путь с другим именем
		- `/home/ruby/.ssh/id_rsa_deploy`
    -  Копируем ключ на сервер
	    - `ssh-copy-id -i ~/.ssh/id_rsa_deploy.pub deploy@server_name`
	  - Коннектимся по ssh
 
**Готово**

2. Работа с ssh на сервере для работы с github
	- Генерируем ключ
		- `ssh-keygen`   Жмем везде enter    
	- Передать админу github пуличный ключ для коннекта к проекту 

**Работа с ssh завершена**

# Запуск проекта на сервере
Проект можно размещать в домашней директории /Projects/project.loc, либо в /var/www. 
1. Работы с git
	  - Делаем папку для проекта в директории home пользователя
	  - Клонируем проект по ssh в папку
	  - Переходим в нужную ветку
  2. Настраиваем работу проекта на сервере
	  - Копируем env файл
		  -  cp .env.example .env
	  - Прописываем наши настройки к БД, другие настройки.
2. Настраиваем nginx
	- Копируем дефолтный конфиг `/etc/nginx/conf.d/default.conf`    
	- Меняем папку для входа на  `root /home/user/Projects/somename/public`
    - Меняем server-root 
    - Добавляем домен в файл hosts `/etc/hosts`
    - Проверяем конфиг nginx на ошибки     
	    - `sudo nginx -t`
    - Перегружаем nginx
	    - `sudo systemctl restart nginx`
3. Composer install
4.  Ставим права на папку storage для nginx
	-  `sudo chgrp -R www-data ./storage/`
	-  `sudo chmod -R 775 ./storage`
5. `git config core.fileMODE false` - если добавились файлы из storage
6.  Laravel
	- php artisan key:generate
	- php artisan migrate
7.  Собираем фронт запускаем npm i    
8.  Ставим права `sudo chmod -R 775 ./node_modules`
9.  Собираем продакшн `npm run prod`
    
**С горем пополам, через все перепетии, проект должен запуститься:)**
# Настройка circleci
# Настройка деплоя
