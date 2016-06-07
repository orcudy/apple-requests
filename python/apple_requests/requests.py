import json
from . import bridge

class Request:
    def __init__(self, cert_file, priv_key, url="https://api.development.push.apple.com", topic=None):
        self.cert_file = cert_file
        self.priv_key = priv_key
        self.url = url
        self.topic = topic

    def _sanitize_token(self, token):
        return ''.join(token.strip('<>').split(' '))

    def _generate_payload(self, alert, sound=None, data=None):
        payload_keys = {"aps" : {}}
        payload_keys['aps']['alert'] = alert
        if sound:
            payload_keys['aps']['sound'] = sound
        if data:
            payload_keys['data'] = data
        return json.dumps(payload_keys)
        
    def send(self, token, alert, sound=None, data=None):
        payload = self._generate_payload(alert, sound, data)
        sanitized_token = self._sanitize_token(token)
        bridge.send_apn_notification(self.url,
                                     self.cert_file,
                                     self.priv_key,
                                     token,
                                     self.topic,
                                     payload)
            



