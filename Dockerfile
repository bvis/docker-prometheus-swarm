FROM prom/prometheus:v1.2.1

MAINTAINER Basilio Vera <basilio.vera@softonic.com>

ADD ./prometheus.yml /etc/prometheus/prometheus.yml
