import time
import paho.mqtt.client as paho

evse_client = paho.Client(client_id="evse", userdata=None, protocol=paho.MQTTv5)
evse_client.connect("evse-mqtt-server", 1883)

ev_client = paho.Client(client_id="ev", userdata=None, protocol=paho.MQTTv5)
ev_client.connect("ev-mqtt-server", 1883)

evse_payload = '{"data":{"id":"74752647-ff0b-459d-b1fa-89c54a3b1cf9","origin":"evse_slac"},"name":"enter_bcd","type":"call"}'
ev_payload   = '{"data":{"id":"e61f38cf-16f4-4da8-bb9f-5e3216e7f809","origin":"ev_slac"},"name":"trigger_matching","type":"call"}'

evse_client.publish("everest/evse_slac/main/cmd", payload=evse_payload)
ev_client.publish("everest/ev_slac/main/cmd", payload=ev_payload)
