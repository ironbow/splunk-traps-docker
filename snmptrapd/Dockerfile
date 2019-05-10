FROM sig9/snmptrapd

COPY ./snmp-mibs/ /usr/local/share/snmp/mibs
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh
RUN apk --no-cache add net-snmp
RUN echo 'disableAuthorization yes' > /etc/snmp/snmptrapd.conf
RUN snmptrapd -m +ALL

EXPOSE 162/udp

ENTRYPOINT ["/entrypoint.sh"]
