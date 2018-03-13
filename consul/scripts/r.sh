curl -XPOST -H 'Content-Type: application/json' -d \
'{"ID": "consul",
  "Name": "consul",
  "Tags": ["urlprefix-consul*/"],
  "Address": "127.0.0.1",
  "Port": 8500,
  "EnableTagOverride": false,
  "Check": {"HTTP": "http://127.0.0.1:8500/", "Interval": "15s"} }' \
'http://127.0.0.1:8500/v1/agent/service/register'


