# BiglyBT-Docker
BiglyBT bittorrent client container
```
# mkdir biglybt-downloads && chown 1000:1000 biglybt-downloads
# docker compose up -d
```

## Configuration

```
# docker attach biglybt_docker
```
Disable unneeded features
```
set locale en
plugin startup azupnpav off
set update.start false boolean
set Plugin.PluginUpdate.enable.update false boolean
set "Plugin.DHT Tracker.dhttracker.enable_alt" false boolean
set "Plugin.DHT Tracker.dhttracker.tracknormalwhenoffline" false boolean
set "Plugin.DHT Tracker.dhttracker.tracklimitedwhenonline" false boolean
set Plugin.azlocaltracker.Plugin.localtracker.enable false boolean
set Plugin.UPnP.upnp.enable false boolean
```
Configure Network
```
set "Bind IP" "eth0" string
set TCP.Listen.Port 49000
set UDP.Listen.Port 49000
set UDP.NonData.Listen.Port 49000
```
Configure Web Interface
```
plugin install xmwebui
set "Plugin.xmwebui.UPnP Enable" true boolean
set "Plugin.xmwebui.Bind IP" eth0 string
set "Plugin.xmwebui.Pairing Enable" false boolean
set "Plugin.xmwebui.Password Enable" true boolean
set "Plugin.xmwebui.User" biglybt string
set "Plugin.xmwebui.Password" "biglybt!Password" password
```
Detach crtl^P+crtl^Q

