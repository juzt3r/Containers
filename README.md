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