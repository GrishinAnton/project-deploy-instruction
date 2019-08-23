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
3. **Работа с БД завершена**

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
  - Устанавливаем git
	  - `sudo apt install git`
  - Клонируем проект по ssh в папку
  - Переходим в нужную ветку
