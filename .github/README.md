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

### トークン発行

#### コマンド
```sh
curl \
  -s \
  --request POST \
  --url 'http://127.0.0.1//zabbix/api_jsonrpc.php' \
  --header 'Content-Type: application/json-rpc' \
  --data '{"jsonrpc":"2.0","method":"user.login","params":{"user":"Admin","password":"zabbix"},"id":1}' \
  --insecure | jq -r .result
```

#### 実行結果サンプル

```sh
root@7e17ef2b2656:/home/admin# curl -s --request POST --url 'http://127.0.0.1//zabbix/api_jsonrpc.php' --header 'Content-Type: application/json-rpc' --data '{
    "jsonrpc":"2.0",
    "method":"user.login",
    "params":{
        "user":"Admin",
        "password":"zabbix"
    },"id":1
}' --insecure | jq -r .result
1c53e157df74e42191916e1d6c9e47ea
root@7e17ef2b2656:/home/admin#
```

#### フィルタ無し

```json
{
  "jsonrpc": "2.0",
  "result": "2742f24013cfe6b532537df94422357b",
  "id": 1
}
```

### 登録ホスト一覧

```sh
curl -s -k -d '{
    "auth": "8e52411cb6d233020a7ca37703f89a95",
    "method": "host.get",
    "id": 1,
    "params": {
        "output": "extend"
    },
    "jsonrpc": "2.0"
}' -H "Content-Type: application/json-rpc" http://172.21.83.191/zabbix/api_jsonrpc.php | jq
```
