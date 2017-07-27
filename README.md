

# Creating a Data Volume
docker volume create --name metrics_data

See contents of the metrics_data volume:
docker run --rm -i -v=metrics_data:/prometheus busybox find /prometheus

# Configure Exporter on Secure Agent

Download jxm_exporter from https://github.com/prometheus/jmx_exporter.

# Optional PostGreSql Monitoring

https://grafana.com/dashboards/455
or
https://grafana.com/dashboards/355