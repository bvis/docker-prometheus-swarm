# Prometheus Swarm

A sample image that can be used as a base for collecting Swarm mode metrics in a prometheus

## How to test it

You can start collecting metrics with something like:

```
docker network create --driver overlay monitoring

docker service create --mode global \
  --name cadvisor \
  --network monitoring \
  --publish 8080 \
  --mount type=bind,src=/,dst=/rootfs:ro \
  --mount type=bind,src=/var/run,dst=/var/run:rw \
  --mount type=bind,src=/sys,dst=/sys:ro \
  --mount type=bind,src=/var/lib/docker/,dst=/var/lib/docker:ro \
  google/cadvisor:latest

docker service create --mode global \
  --name node-exporter \
  --network monitoring \
  --publish 9100 \
  prom/node-exporter

docker service create \
  --name prometheus \
  --network monitoring \
  --publish 9090:9090 \
  basi/prometheus-swarm

docker service create \
  --name grafana \
  --network monitoring \
  --network traefik-net \
  --publish 3000:3000 \
  -e "GF_SERVER_ROOT_URL=http://grafana.my-domain.com" \
  -e "GF_SECURITY_ADMIN_PASSWORD=ADMINPASS" \
  grafana/grafana

```

Once it's initiated you just need to add the prometheus as a data source in Grafana and import an existing dashboard for getting impressive graphs.

Now you can configure the prometheus datasource and import any Grafana dashboard that measures the cadvisor and node-exporter metrics.

* This is just an initial test *
