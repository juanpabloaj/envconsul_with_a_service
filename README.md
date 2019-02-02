## Use distributed variables with envconsul

Start consul

    docker-compose up -d

Set variable `max_conns`

    docker-compose exec consul-server-bootstrap consul kv put hello-app/max_conns 10

Start python/flask service

    docker-compose -f docker-compose-services.yaml build
    docker-compose -f docker-compose-services.yaml up -d

Request to to service

    curl localhost:5000

to get the value from the service

	{"value":"10"}

Set variable `max_conns`

    docker-compose exec consul-server-bootstrap consul kv put hello-app/max_conns 20

Request to the service

    curl localhost:5000

to get the value from the service

    {"value":"20"}

### References

* https://github.com/hashicorp/envconsul
