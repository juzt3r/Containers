# Full Stack Miljø bestående av tre komponenter

## App
Applikasjonen er en enkel API

API\Uptime
Bare får å få uptime på current. Denne var bare for å teste applikasjonen først.
API\Users
USERS henter ut alle brukere som ligger i Databaseserveren om er en mysql-docker container.

DEP:
``` 
dotnet add package Microsoft.EntityFrameworkCore --version 8.0.0
dotnet add package MySql.EntityFrameworkCore --version 8.0.33
dotnet add package Pomelo.EntityFrameworkCore.MySql

``` 


## Proxy
nginx

## DB
mysql


### Howto:
 docker-compose up -d
 docker ps



 https://hub.docker.com/repository/docker/juzt3r/dotnet_api/general


 C:\Users\juzt3>curl localhost:8080/api/users
[{"id":1,"username":"johndoe","email":"johndoe@example.com"},{"id":2,"username":"janedoe","email":"janedoe@example.com"},{"id":3,"username":"alice","email":"alice@example.com"},{"id":4,"username":"Eirik","email":"escimo@Gay4Pay.com"},{"id":5,"username":"Leif","email":"LeifTheBoss@SuperDude.com"},{"id":6,"username":"bob","email":"bob@example.com"}]