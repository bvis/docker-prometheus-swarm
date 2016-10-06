FROM prom/prometheus:v1.1.3

MAINTAINER Basilio Vera <basilio.vera@softonic.com>

ADD ./prometheus.yml /etc/prometheus/prometheus.yml
