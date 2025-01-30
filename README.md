---
name: Leif-Petter Johansen 
contact: (mailto:leif-petter.johansen@gokstadakademiet.no)

name: Eirik Schølseth 
contact: (mailto:eirik.scholseth@gokstadakademiet.no)
---


* Opprett en mappe f.eks ```docker```
* flytt ```docker-compose.yml``` filen til nye mappen
* Kjør steget ```Generere test-data for database```
* Kjør steget ```Generere nginx.conf```
* Kjør kommandoen ``` docker-compose up -d ``` for å starte opp "detached". 
* For å verifisere at ting fungerer kjør kommandoen ```curl localhost\api\Users```

``` Eksempel output
 C:\Users\juzt3>curl localhost/api/users
[{"id":1,"username":"johndoe","email":"johndoe@example.com"},{"id":2,"username":"janedoe","email":"janedoe@example.com"},{"id":3,"username":"alice","email":"alice@example.com"},{"id":4,"username":"Eirik","email":"escimo@Gay4Pay.com"},{"id":5,"username":"Leif","email":"LeifTheBoss@SuperDude.com"},{"id":6,"username":"bob","email":"bob@example.com"}]
``` 
## Forarbeid for å opp testmiljø


### Generere test-data for database
Vi genererer en init.sql fil som lager en database og fyller den med test data
Da kan man bruke denne koden: 
``` 
echo "CREATE TABLE IF NOT EXISTS USERS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO USERS (username, email) VALUES
('johndoe', 'johndoe@example.com'),
('janedoe', 'janedoe@example.com'),
('alice', 'alice@example.com'),
('Eirik', 'escimo@Gay4Pay.com'),
('Leif', 'LeifTheBoss@SuperDude.com'),
('bob', 'bob@example.com');" > init.sql

```

### Genereate nginx.conf
Lager nginx-config filen som sier at man skal redirecte trafikk på port 80 til port api-container:5000
```

echo "
events {}

http {
    server {
        listen 80;
        location / {
            proxy_pass http://api:5000;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
        }
    }
}" > nginx.conf
```



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






