from ctypes import *

cdll.LoadLibrary("libapns.so.1")
libapns = CDLL("libapns.so.1")

def send_apn_notification(url, cert_file, priv_key, token, topic, data):
    libapns.send_apn_notification(c_char_p(url),
                                  c_char_p(cert_file),
                                  c_char_p(priv_key),
                                  c_char_p(token),
                                  c_char_p(topic),
                                  c_char_p(data))


            



