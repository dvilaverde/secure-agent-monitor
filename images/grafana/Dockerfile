FROM grafana/grafana:4.6.3

COPY config-n-run.sh config-n-run.sh

COPY grafana.ini /etc/grafana/grafana.ini

COPY dashboards /var/lib/grafana/dashboards

EXPOSE 3000

ENTRYPOINT ["/config-n-run.sh"]
