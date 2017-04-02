# Prometheus Swarm

A sample image that can be used as a base for collecting Swarm mode metrics in Prometheus

## How to use it

You can use the provided `docker-compose.yml` file as an example. You can deploy the full stack with the command:

```bash
docker stack deploy --compose-file docker-compose.yml monitoring
```

The grafana by default is exposed in the 3000 port and the credentials are admin/admin, be sure you use something different in your deploys.

Once everything is running you just need to connect to grafana and import the [Docker Swarm & Container Overview](https://grafana.net/dashboards/609)

In case you don't have an Elasticsearch instance with logs and errors you could provide an invalid configuration or you could launch the sample stack with ELK.

```bash
docker stack deploy --compose-file docker-compose.logging.yml logging
```

Be patient, some services can take some minutes to start.
This stack sample is using old versions of Elasticsearch and Kibana intentionally for simplify the configuration.

### Docker Engine Metrics
In case you have activated the metrics endpoint in your docker swarm cluster you could import the [Docker Engine Metrics](https://grafana.net/dashboards/1229) dashboard as well, which offers complementary data about the docker daemon itself.

More info available about this dashboard and its configuration in this post [Docker Daemon Metrics in Prometheus](https://medium.com/@basilio.vera/docker-swarm-metrics-in-prometheus-e02a6a5745a#.ei8n7eykb)
