FROM sig9/snmptrapd

COPY ./snmp-mibs/ /usr/local/share/snmp/mibs

RUN apk --no-cache add net-snmp
RUN echo 'disableAuthorization yes' > /etc/snmp/snmptrapd.conf
RUN snmptrapd -m +ALL

CMD ["snmptrapd", "-L", "-f", "/var/log/snmp-traps"]
