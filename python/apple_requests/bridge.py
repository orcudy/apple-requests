from ctypes import *

cdll.LoadLibrary("libapple_requests.so.0")
libapns = CDLL("libapple_requests.so.0")

def send_apn_notification(url, cert_file, priv_key, token, topic, data):
    libapns.send_apn_notification(c_char_p(str.encode(url)),
                                  c_char_p(str.encode(cert_file)),
                                  c_char_p(str.encode(priv_key)),
                                  c_char_p(str.encode(token)),
                                  c_char_p(str.encode(topic)),
                                  c_char_p(str.encode(data)))


            



