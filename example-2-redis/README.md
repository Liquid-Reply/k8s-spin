# Spin using Redis on Kubernetes

## Scenario

This scenario will demonstrate deployment and configuration of a Spin application connecting to a Redis database via [Dynamic Application Configuration](https://developer.fermyon.com/spin/v2/dynamic-configuration).

## Usage

Deploy a simple Redis instance:

```
$ kubectl apply -f redis.yaml
```

Add data to redis:

```
$ redis-cli                                         
127.0.0.1:6379> SET hello "World"
OK
127.0.0.1:6379> SET spin "Rocks!!"
OK
127.0.0.1:6379> GET hello
"World"
127.0.0.1:6379> get spin
"Rocks!!"
```

Deploy the Spin application:

```
$ kubectl apply -f deploy_spin-redis.yaml
```

Access the Spin application:

```
$ kubectl port-forward deployment/spin-redis 8000:80
```

And access `localhost:8000` in your browser.
