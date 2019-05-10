FROM splunk/splunk:latest

COPY ./inputs/ /opt/splunk/etc/apps/search/local/

CMD ["/sbin/entrypoint.sh", "start-service"]