# Full Stack miljø bestående av tre komponenter
### Prosjektmedlemmer: 
* Leif-Petter Johansen - (mailto:leif-petter.johansen@gokstadakademiet.no)
* Eirik Schølseth - (mailto: eirik.scholseth@gokstadakademiet.no)

## Prosjektbeskrivelse
Dette prosjektet setter opp et full-stack miljø med tre hovedkomponenter:
- **Nginx:** Reverse proxy for API-en.
- **.NET API:** Web API for håndtering av brukerdatabase.
- **MySQL:** Database for lagring av brukerdata.

Formålet med prosjektet er å demonstrere hvordan man kan sette opp en hel stack ved hjelp av Docker, Docker Compose og Nginx.

### Teknologier som benyttes:
- Docker
- Docker Compose
- Nginx
- .NET 6 API
- MySQL


## Hvordan starte prosjektet med git clone

``` bash
cd MyCode
git clone https://github.com/juzt3r/Containers 
cd Containers
docker-compose up -d
```
## Hvordan starte prosjektet uten git clone
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
events {
    worker_connections 1024; 
}

http {
    server {
        listen 80;

        server_name localhost;

        location / {
            proxy_pass http://api:8080;  
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
    }
}
" > nginx.conf
```





### Howto:
 docker-compose up -d
 docker ps








