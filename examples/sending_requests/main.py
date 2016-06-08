from apple_requests import requests

def main():
    base = "/home/chris/AppleRequests/certs"
    cert_file = base + "/apple_requests.pem"
    priv_key  = base + "/apple_requests.key"
    topic = "com.applerequests.demo"
    alert = "Chaos monkey! =)"
    token = "cd31989834ece4c328ce32b24dcaa9b00a252ee31a35a387253799b2b6904c66"

    request = requests.Request(cert_file=cert_file, priv_key=priv_key, topic=topic)
    request.send(alert=alert, token=token)

if __name__ =='__main__':
    main()
