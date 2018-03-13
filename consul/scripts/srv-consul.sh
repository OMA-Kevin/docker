curl -XPOST -H 'Content-Type: application/json' -d \
'{"ID": "manual:consul:8500",
  "Name": "consul",
  "Tags": ["urlprefix-consul*/"],
  "Address": "192.168.1.120",
  "Port": 8500,
  "EnableTagOverride": false,
  "Check": {"HTTP": "http://192.168.1.120:8500/", "Interval": "5s"} }' \
'http://192.168.1.120:8500/v1/agent/service/register'
