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
3. **Работа с БД завершена**

# Настройка доступа по ssh
# Формирование файлов для выполнения команд
# Настройка circleci
# Настройка деплоя
