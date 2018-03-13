 curl -X PUT -d '{"Datacenter": "dc1", "Node": "host", "Address": "192.168.1.121", "Service": {"Service": "ssh", "Port": 22}}' http://127.0.0.1:8500/v1/catalog/register
