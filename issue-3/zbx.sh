if [ -z $token ] ; then
	if [ -z $username ] ; then
		read -p 'Username> ' username
	fi
	if [ -z $password ] ; then
		read -p 'Password> ' password
	fi
	token=$(curl \
		-s \
		--request POST \
		--url 'http://'${host}'/zabbix/api_jsonrpc.php' \
		--header 'Content-Type: application/json-rpc' \
		--data '{"jsonrpc":"2.0","method":"user.login","params":{"user":"'${username}'","password":"'${password}'"},"id":1}' | jq -r .result)
fi

curl \
  -s \
  --request POST \
  --url 'http://'${host}'/zabbix/api_jsonrpc.php' \
  --header 'Content-Type: application/json-rpc' \
  --data '{
    "auth": "'${token}'",
    "method": "host.get",
    "id": 1,
    "params": {
        "output": "extend"
    },
    "jsonrpc": "2.0"
}' | jq .result[0]

curl \
  -s \
  --request POST \
  --url 'http://'${host}'/zabbix/api_jsonrpc.php' \
  --header 'Content-Type: application/json-rpc' \
  --data '{
    "jsonrpc": "2.0",
    "method": "problem.get",
    "params": {
        "output": "extend",
        "recent": false,
        "suppressed": true,
	"time_till": 0,
        "sortfield": ["eventid"],
        "sortorder": "DESC"
    },
    "auth": "'${token}'",
    "id": 1
  }' | jq 
