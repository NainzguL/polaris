
# Polaris character sheet

A web application that allows player and game master to create and manage there character sheet for the rpg polaris. 

## Deploy with Docker

First install Docker. You may also need to enable the Swarm mode (`docker swarm init`). Then create the files that will contain the DB password in the container folder: db_root_pwd.txt and php_db_pwd.txt (you may use the script create_secret.sh). Finally, deploy the stack with docker stack:

```
cd container
docker-compose build
docker stack deploy -c .\docker-compose.yml pola
```
Then the website is accessible on port 8080: http://127.0.0.1:8080/

## Architecture

### DB

For the database we use [mySql](https://www.mysql.com). The schemas of the DB is defined by the SQL file in the folder db. The DB-schemas is versioned with [flyway](https://flywaydb.org/getstarted/how). This ensure a robust schema evolution. During migration flyway will apply all SQL script as "versioned migration". Each versioned migration has a version, a description and a checksum. The version must be unique. The description is purely informative for you to be able to remember what each migration does. The checksum is there to detect accidental changes. Versioned migrations are applied in order exactly once. 

It is important to notice that once a SQL script was applied in the production DB as versioned migration, it must no longer be changed. If you want to fix a typo in a column name, you should not change the corresponding SQL script. You have to create a new SQL script that will alter table for fixing the column name. For now, we don't have yet a production DB, therefore the SQL script can be modified.

In order to be recognized as versioned migration, the SQL scripts must be compliant with the following naming pattern: 

```
V_<Version>__<Description>.sql
```

The Version is composed of numbers separate by dots. The Description can be any sentence where words are separate by underscores or spaces. For instance `V2.1.4__Add_new_table.sql` is a compliant naming pattern. You can find more information in the official [documentation](https://flywaydb.org/documentation/migrations)


### Php Server

For generating the dynamic web content we use php. To be compliant with the deployment model, all php services must be stateless. All data must be saved in the php-session or in the DB.
There is also only 2 entry points for handling the incoming request. One for the crud: crud_entry_point.php and one for the web page html_entry_point.php

### Client side

One client side we bosstrapt and jquery.

### Docker deployment

For the DB we use the standard mySql container, and we run a script that create 2 user: root and php_user. Flyway is run in the fill-db container, all the content of the db folder will be copied in the fill-db container. This container will set-up/migrate the db-shemas and exit. 

We use nginx as web server, it has it own container. All file in the public folder will be served by nginx as static resource, for this the content of the folder public is copied in the nginx container. Nginx will forward all URL that end with ".php" to the php container. The php container run PHP-FPM and will execute the php script. The content of the php folder is copied in the php container. Note that the nginx container do not contain the php script, this increase the security.

## For developer

Using the deployment stack is not suited for daily development work. When the developer want to test the changes that is made in public folder or php scripts, he must remove the stack, rebuild it and redeploy it. The Solution is to use the stack docker-compose-dev. In this stack the public folder is mount as volume in the nginx container and the php folder is mount in the php container. Therefore, the change made inside these folder are directly visible from container. There is no more volume for the DB, therefore each time that the DB container is stopped, all the data are lost. This is intended, because, if you broke the DB, you can simply stop and restart the DB container. The DB will be then refill with the container fill-db. 

For running docker-compose-dev: 

```
docker stack rm pola #optional for removing the not dev stack
docker-compose -f .\docker-compose-dev.yml build
docker stack deploy -c .\docker-compose-dev.yml pola_dev
```

But if you want change the container definition or the configuration of nginx, you have to remove the stack, rebuild and redeploy it:

```
docker stack rm pola_dev
docker-compose -f .\docker-compose-dev.yml build
docker stack deploy -c .\docker-compose-dev.yml pola_dev
```

### Develop with DB

Deploy the stack, go into the DB container and test your SQL script.

```
docker container exec -it <name or id of the pola-db container> bash -l
root@pola-db:/# mysql --user=root  "--password=$(< /run/secrets/db_root_pwd)" polaris
mysql> 
```


