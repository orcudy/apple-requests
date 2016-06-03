import apnrequests

def main():
    cert_file = "/srv/www/pypush/pypush/conf/TwoefayAPNCertificate.pem"
    priv_key = "/srv/www/pypush/pypush/conf/TwoefayAPNCertificate.key"
    topic = "com.twoefay.twoefay"
    request = apnrequests.Request(cert_file=cert_file, priv_key=priv_key,topic=topic)
    request.send(alert="Main test", token="8be4b006a4a4af968d7619c5a1932e2a76e7ae5dc5c6be049d5e784db4026c57")

if __name__ =='__main__':
    main()
