# iocage-jdownloader-plugin
Plugin to run an instance of JDownloader in TrueNAS

## Installation

```
iocage fetch --plugins JDownloader ip4_addr="interface|IPaddress"
```

## Set up MyJDownloader account

```
iocage set --plugin email=yourMyJDownloader@email.com password=yourPassword devicename="Name to show in the dashboard [OPTIONAL]"
```