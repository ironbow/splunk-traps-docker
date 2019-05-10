# splunk-traps-docker
This repository provides a docker-compose file, and the needed prerequisites, to stand up a Splunk instance that receives syslog and SNMP traps from devices on pre-configured indexes, data inputs, etc.

# Quickstart
## Clone the Repository

All you need to do is clone the repository:

```bash
git clone https://git.ironbowlab.com/rwolfe/splunk-traps-docker.git
```

If you get an SSL error when trying to clone, you can disable SSL verification globally with:

```bash
git config --global http.sslVerify false
```

Then change into the working directory:

```bash
cd splunk-traps-docker
```
## Run `docker-compose up`
Now, just run the docker-compose file. The `-d` runs as detached so that you don't get excessive log output:

```bash
docker-compose up -d
```

**If you want to change the password, modify it in the docker-compose file before running docker-compose.**

Splunk will take a couple of minutes to fully come up.

## Access Splunk Web
Now you can access Splunk using `http://<YOUR_IP_OR_FQDN>:8000/` and loging with username `admin` and password `changeme` (or what you changed it to). 

Any logs or traps you're forwarding will, by default, enter the `dna-fabric-devices` index. You can tweak the config files in `splunk/inputs/*.conf` to tweak this to your own settings. Afterwards, you will need to rebuild the instance. 

Alternatively, you can also configure any changes you want on Splunk Web after the containers are running.

By default, you can search for `index="dna-fabric-devices"` to see your data.
# Sending data to Splunk
## Sending logs to Splunk

The Splunk instance is listening to syslog inputs on port `tcp/8515`. 

For example, on Cisco IOS-\*:

```
logging trap critical
logging origin-id hostname
logging host 10.12.100.55 transport tcp port 8515
```
## Sending SNMP traps to Splunk
The `snmptrapd` docker container listens on port `udp/162` for SNMP traps. 

You can configure your devices to send SNMP traps to it, for example:

```bash
snmp-server enable traps snmp authentication linkdown linkup coldstart warmstart
snmp-server enable traps eigrp
snmp-server enable traps ospf state-change
snmp-server enable traps ospf errors
snmp-server enable traps ospf retransmit
snmp-server enable traps ospf lsa
snmp-server host 10.12.100.55 version 2c DNAC
```
# Suggested Changes
Feel free to suggest changes that should be made to the default state of this to include other common Splunk configurations / source types.
