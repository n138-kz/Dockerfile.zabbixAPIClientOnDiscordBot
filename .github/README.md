# [Dockerfile.zabbixAPIClientOnDiscordBot](https://github.com/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)

[![GitHub Extra Pins](https://images-ext-1.discordapp.net/external/0gm6rf8zufn1DOGDfaYYSGnL52hFYQQzAJ56jFwdpQ4/https/opengraph.githubassets.com/191aab8a532d04ca43426802fd45b19ba800379d72ebe1f80419d388d98a39bc/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot?format=webp)](https://github.com/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)

## Repos Info

<div align="center">

  [![GitHub repo license](https://img.shields.io/github/license/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/LICENSE)
  [![GitHub top language](https://img.shields.io/github/languages/top/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/../../)
  [![GitHub repo size](https://img.shields.io/github/repo-size/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/../../)
  [![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/../../)

</div>
<div align="center">

  [![GitHub last commit](https://img.shields.io/github/last-commit/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/../../commits)
  [![GitHub commit activity](https://img.shields.io/github/commit-activity/w/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/../../commits)
  [![GitHub commit activity](https://img.shields.io/github/commit-activity/t/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/../../commits)
  [![GitHub language count](https://img.shields.io/github/languages/count/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/../../)

</div>
<div align="center">

  [![GitHub issues](https://img.shields.io/github/issues/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/../../issues)
  [![GitHub issues closed](https://img.shields.io/github/issues-closed/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/../../issues)
  [![GitHub pull requests](https://img.shields.io/github/issues-pr/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/../../pulls)
  [![GitHub pull requests closed](https://img.shields.io/github/issues-pr-closed/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot)](/../../pulls)

</div>
<div align="center">

  [![](https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/channel/UCOX8Iv1r0V18lbOnohE7lWQ)
  [![](https://img.shields.io/badge/Twitch-6441A5?style=for-the-badge&logo=twitch&logoColor=white)](https://www.twitch.tv/yuukomiya)
  [![](https://img.shields.io/badge/X-000000?style=for-the-badge&logo=x&logoColor=white)](https://x.com/n138kz)
  <br>
  [![](https://img.shields.io/youtube/channel/subscribers/UCOX8Iv1r0V18lbOnohE7lWQ)](https://youtube.com/channel/UCOX8Iv1r0V18lbOnohE7lWQ)
  [![](https://img.shields.io/twitch/status/YuuKomiya)](https://www.twitch.tv/yuukomiya)

</div>

## Refs

- [![](https://www.google.com/s2/favicons?size=64&domain=https://discord.com)Developer Console](https://discord.com/developers/applications)
- [![](https://www.google.com/s2/favicons?size=64&domain=https://discord.com)Discord公式リファレンス](https://discord.com/developers/docs/topics/oauth2)
- [![](https://www.google.com/s2/favicons?size=64&domain=https://discord.com)discord.py APIリファレンス](https://discordpy.readthedocs.io/ja/latest/api.html)
- [![](https://www.google.com/s2/favicons?size=64&domain=https://github.com)Dockerfile.zabbixAPIClientOnDiscordBot](https://github.com/n138-kz/Dockerfile.zabbixAPIClientOnDiscordBot/)

## License

[Copyright (c) 2025 Yuu Komiya (n138), Under MIT License](LICENSE)  

## memo

### API version

#### コマンド

```sh
curl \
  -s \
  --request POST \
  --url 'http://'${host}'/zabbix/api_jsonrpc.php' \
  --header 'Content-Type: application/json-rpc' \
  --data '{"jsonrpc":"2.0","method":"apiinfo.version","params":{},"id":1}' | jq
```

#### 実行結果サンプル

<details>

```json
{
  "jsonrpc": "2.0",
  "result": "5.0.47",
  "id": 1
}
```

</details>

### トークン発行

#### コマンド

```sh
curl \
  -s \
  --request POST \
  --url 'http://'${host}'/zabbix/api_jsonrpc.php' \
  --header 'Content-Type: application/json-rpc' \
  --data '{"jsonrpc":"2.0","method":"user.login","params":{"user":"Admin","password":"zabbix"},"id":1}' \
  --insecure | jq -r .result
```

#### 実行結果サンプル / フィルタ無し

<details>

```json
{
  "jsonrpc": "2.0",
  "result": "2742f24013cfe6b532537df94422357b",
  "id": 1
}
```

</details>

### 登録ホスト一覧

#### コマンド

```sh
curl \
  -s \
  --request POST \
  --url 'http://'${host}'/zabbix/api_jsonrpc.php' \
  --header 'Content-Type: application/json-rpc' \
  --data '{
    "auth": "2742f24013cfe6b532537df94422357b",
    "method": "host.get",
    "id": 1,
    "params": {
        "output": "extend"
    },
    "jsonrpc": "2.0"
}' | jq
```

#### 実行結果サンプル

<details>

```json

{
  "jsonrpc": "2.0",
  "result": [
    {
      "hostid": "10000",
      "proxy_hostid": "0",
      "host": "localhost",
      "status": "0",
      "disable_until": "0",
      "error": "",
      "available": "1",
      "errors_from": "0",
      "lastaccess": "0",
      "ipmi_authtype": "-1",
      "ipmi_privilege": "2",
      "ipmi_username": "",
      "ipmi_password": "",
      "ipmi_disable_until": "0",
      "ipmi_available": "0",
      "snmp_disable_until": "0",
      "snmp_available": "1",
      "maintenanceid": "0",
      "maintenance_status": "0",
      "maintenance_type": "0",
      "maintenance_from": "0",
      "ipmi_errors_from": "0",
      "snmp_errors_from": "0",
      "ipmi_error": "",
      "snmp_error": "",
      "jmx_disable_until": "0",
      "jmx_available": "0",
      "jmx_errors_from": "0",
      "jmx_error": "",
      "name": "localhost",
      "flags": "0",
      "templateid": "0",
      "description": "",
      "tls_connect": "1",
      "tls_accept": "1",
      "tls_issuer": "",
      "tls_subject": "",
      "tls_psk_identity": "",
      "tls_psk": "",
      "proxy_address": "",
      "auto_compress": "1",
      "inventory_mode": "-1"
    }
  ],
  "id": 1
}
```

</details>

### 障害一覧

https://www.zabbix.com/documentation/current/jp/manual/api/reference/problem/get

#### コマンド

```sh
curl \
  -s \
  --request POST\
  --url 'http://'${host}'/zabbix/api_jsonrpc.php'\
  --header 'Content-Type: application/json-rpc'\
  --data '{
    "auth": "2742f24013cfe6b532537df94422357b",
    "method": "problem.get",
    "id": 1,
    "params": {
        "output": "extend"
    },
    "suppressed": true,
    "sortfield": ["clock"],
    "sortorder": "DESC",
    "jsonrpc": "2.0"
  }' | jq
```

#### 実行結果サンプル

<details>

※**発生中障害のみを表示させる方法模索中**

```json

{
  "jsonrpc": "2.0",
  "result": [
    {
      "eventid": "1085452",
      "source": "0",
      "object": "0",
      "objectid": "23398",
      "clock": "1683104975",
      "ns": "408960186",
      "r_eventid": "0",
      "r_clock": "0",
      "r_ns": "0",
      "correlationid": "0",
      "userid": "0",
      "name": "Disk-131072: Disk space is low (used > 80%)",
      "acknowledged": "1",
      "severity": "1",
      "opdata": "Space used: *UNKNOWN* of *UNKNOWN* (*UNKNOWN*)",
      "suppressed": "0",
      "urls": []
    }
  ],
  "id": 1
}
```

</details>
