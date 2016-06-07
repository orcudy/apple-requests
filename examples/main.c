#include <apple_requests.h>

int main(int argc, char **argv) {
  char *cert_file_path = "/srv/www/pypush/pypush/conf/TwoefayAPNCertificate.pem";
  char *priv_key_path = "/srv/www/pypush/pypush/conf/TwoefayAPNCertificate.key";
  char *url = "https://api.development.push.apple.com";
  char *token = "8be4b006a4a4af968d7619c5a1932e2a76e7ae5dc5c6be049d5e784db4026c57";
  char *topic = "com.twoefay.twoefay";
  char *data = "{\"aps\": {\"alert\": \"Hellow from nghttp2! =)\"}}";
  send_apn_notification(url, cert_file_path, priv_key_path, token, topic, data);
  return 0;
}
