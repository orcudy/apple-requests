from ctypes import *

cdll.LoadLibrary("libpypush.so.1")
libpypush = CDLL("libpypush.so.1")
send_apn_notification = libpypush.send_apn_notification

cert_file_path = c_char_p("/srv/www/pypush/pypush/conf/TwoefayAPNCertificate.pem");
priv_key_path = c_char_p("/srv/www/pypush/pypush/conf/TwoefayAPNCertificate.key");
url = c_char_p("https://api.development.push.apple.com");
token = c_char_p("8be4b006a4a4af968d7619c5a1932e2a76e7ae5dc5c6be049d5e784db4026c57");
topic = c_char_p("com.twoefay.twoefay");
data = c_char_p("{\"aps\": {\"alert\": \"Fuck yes, python =)\"}}");
            

send_apn_notification(url,
                      cert_file_path,
                      priv_key_path,
                      token,
                      topic,
                      data)

