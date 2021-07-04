import 'package:flutter/material.dart';
import 'package:flutter_openvpn/flutter_openvpn.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String txt = '';
  bool txt2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () async {
                await FlutterOpenvpn.init();
                await FlutterOpenvpn.lunchVpn(
                  """
dev tun
proto tcp

remote public-vpn-212.opengw.net 443

;http-proxy-retry
;http-proxy [proxy server] [proxy port]

cipher AES-128-CBC
auth SHA1
resolv-retry infinite
nobind
persist-key
persist-tun
client
verb 3
<ca>
-----BEGIN CERTIFICATE-----
MIIF3jCCA8agAwIBAgIQAf1tMPyjylGoG7xkDjUDLTANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0pl
cnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNV
BAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTAw
MjAxMDAwMDAwWhcNMzgwMTE4MjM1OTU5WjCBiDELMAkGA1UEBhMCVVMxEzARBgNV
BAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVU
aGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2Vy
dGlmaWNhdGlvbiBBdXRob3JpdHkwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIK
AoICAQCAEmUXNg7D2wiz0KxXDXbtzSfTTK1Qg2HiqiBNCS1kCdzOiZ/MPans9s/B
3PHTsdZ7NygRK0faOca8Ohm0X6a9fZ2jY0K2dvKpOyuR+OJv0OwWIJAJPuLodMkY
tJHUYmTbf6MG8YgYapAiPLz+E/CHFHv25B+O1ORRxhFnRghRy4YUVD+8M/5+bJz/
Fp0YvVGONaanZshyZ9shZrHUm3gDwFA66Mzw3LyeTP6vBZY1H1dat//O+T23LLb2
VN3I5xI6Ta5MirdcmrS3ID3KfyI0rn47aGYBROcBTkZTmzNg95S+UzeQc0PzMsNT
79uq/nROacdrjGCT3sTHDN/hMq7MkztReJVni+49Vv4M0GkPGw/zJSZrM233bkf6
c0Plfg6lZrEpfDKEY1WJxA3Bk1QwGROs0303p+tdOmw1XNtB1xLaqUkL39iAigmT
Yo61Zs8liM2EuLE/pDkP2QKe6xJMlXzzawWpXhaDzLhn4ugTncxbgtNMs+1b/97l
c6wjOy0AvzVVdAlJ2ElYGn+SNuZRkg7zJn0cTRe8yexDJtC/QV9AqURE9JnnV4ee
UB9XVKg+/XRjL7FQZQnmWEIuQxpMtPAlR1n6BB6T1CZGSlCBst6+eLf8ZxXhyVeE
Hg9j1uliutZfVS7qXMYoCAQlObgOK6nyTJccBz8NUvXt7y+CDwIDAQABo0IwQDAd
BgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYDVR0PAQH/BAQDAgEGMA8G
A1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQEMBQADggIBAFzUfA3P9wF9QZllDHPF
Up/L+M+ZBn8b2kMVn54CVVeWFPFSPCeHlCjtHzoBN6J2/FNQwISbxmtOuowhT6KO
VWKR82kV2LyI48SqC/3vqOlLVSoGIG1VeCkZ7l8wXEskEVX/JJpuXior7gtNn3/3
ATiUFJVDBwn7YKnuHKsSjKCaXqeYalltiz8I+8jRRa8YFWSQEg9zKC7F4iRO/Fjs
8PRF/iKz6y+O0tlFYQXBl2+odnKPi4w2r78NBc5xjeambx9spnFixdjQg3IM8WcR
iQycE0xyNN+81XHfqnHd4blsjDwSXWXavVcStkNr/+XeTWYRUc+ZruwXtuhxkYze
Sf7dNXGiFSeUHM9h4ya7b6NnJSFd5t0dCy5oGzuCr+yDZ4XUmFF0sbmZgIn/f3gZ
XHlKYC6SQK5MNyosycdiyA5d9zZbyuAlJQG03RoHnHcAP9Dc1ew91Pq7P8yF1m9/
qS3fuQL39ZeatTXaw2ewh0qpKJ4jjv9cJ2vhsE/zB+4ALtRZh8tSQZXq9EfX7mRB
VXyNWQKV3WKdwrnuWih0hKWbt5DHDAff9Yk2dDLWKMGwsAvgnEzDHNb842m1R0aB
L6KCq9NjRHDEjf8tM7qtj3u1cIiuPhnPQCjY/MiQu12ZIvVS5ljFH4gxQ+6IHdfG
jjxDah2nGN59PRbxYvnKkKj9
-----END CERTIFICATE-----

</ca>


###############################################################################
# The client certificate file (dummy).
# 
# In some implementations of OpenVPN Client software
# (for example: OpenVPN Client for iOS),
# a pair of client certificate and private key must be included on the
# configuration file due to the limitation of the client.
# So this sample configuration file has a dummy pair of client certificate
# and private key as follows.

<cert>
-----BEGIN CERTIFICATE-----
MIIDOjCCAiKgAwIBAgIDAeohMA0GCSqGSIb3DQEBCwUAMBsxGTAXBgNVBAMMEENs
b3VkVlBOIFByb2QgQ0EwHhcNMjEwNjI0MDkxNDA5WhcNNDYwNjI1MDkxNDA5WjBW
MVQwUgYDVQQDDEtweGJ1bGxvcGVudnBuL2hhZGltYWxpa2RldiU0MGdtYWlsLmNv
bS9jOWJiZjI3Zi0yNmM2LTNiOGMtYTlkYS0zYWFjMDEwMTcwMGIwggEiMA0GCSqG
SIb3DQEBAQUAA4IBDwAwggEKAoIBAQCFpnaIpiNIR6NjVA4t3Ovp9PMNcRGAcKcM
Ok31JF+GU6ORZgz5NNUF3cD++W6fiCOKbh4sZeox8nwyq4Ewp0z3ws/G4Y+pVhTB
NG8FzKGuwGmi4da33OUx5aCVfnn/Tjh/cmE76UKo6pycjcTqIhm1WBmX4cGBN3If
WiyM80Fk5Z+K78hQ9NFsA41fODxMZwBmAe1a/BOLncvHozML/Qre9GjySag1zNvW
ZYuuhS0mMgWRAZ8e9XM/KhoX0lOUWvUeTfABnRQueEbW4tGpGeU+Ur6MR1IwWAw0
ufqc2XpcM62WAkaSYJxJ0gyPcqNLPU/ss5lWCxwopjSZ1TEYGzAtAgMBAAGjTDBK
MA4GA1UdDwEB/wQEAwIChDATBgNVHSUEDDAKBggrBgEFBQcDAjAJBgNVHRMEAjAA
MBgGA1UdEQQRMA+BDXB4YnVsbG9wZW52cG4wDQYJKoZIhvcNAQELBQADggEBAFjE
TYOhcCJJ1gB8DQQUh7PdcyD/UDMj6dCdSEm/qWPoaj6lJm16Bbgwj19pKT38C8PQ
I9ybfqwPTyK0udc5hfdIYNcK1xjn/tlGvjoalUhfZEeN+yimooOTtenXacFXC2aH
3IC16UmZGF6uXxZj7ppA6tcjIhFsUHUKby0zaKb9za2gZWmbvgBALaC5BUp7XeR+
VkrVyn97aw8b9hA9SrTjL08YMDV67PjjFmbhJrQZpxZRmBcBVk8ryfyMMkPH103C
gOE6T/xCOLQG6xkOnh9/VGk4ZMvS/lDZLvVWQEAYuywqOPsxGoYg6KoLn1WwyuYR
a2Ds7hFT1/FXyqwF6xY=
-----END CERTIFICATE-----
</cert>

<key>
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAhaZ2iKYjSEejY1QOLdzr6fTzDXERgHCnDDpN9SRfhlOjkWYM
+TTVBd3A/vlun4gjim4eLGXqMfJ8MquBMKdM98LPxuGPqVYUwTRvBcyhrsBpouHW
t9zlMeWglX55/044f3JhO+lCqOqcnI3E6iIZtVgZl+HBgTdyH1osjPNBZOWfiu/I
UPTRbAONXzg8TGcAZgHtWvwTi53Lx6MzC/0K3vRo8kmoNczb1mWLroUtJjIFkQGf
HvVzPyoaF9JTlFr1Hk3wAZ0ULnhG1uLRqRnlPlK+jEdSMFgMNLn6nNl6XDOtlgJG
kmCcSdIMj3KjSz1P7LOZVgscKKY0mdUxGBswLQIDAQABAoIBAAVFiJ1hODkMolQz
p4+FjEShJckc8ZzIVL51ukd2FNJ+kBAXH2HhBJoDoi4sdoGSZBx8tXH43yDzOJTj
EOhzYOTQ6VMl6H28aHsqb0qiRKpY6pHDKK3954htT0U2ROeeFTppr44maDuzbVP7
f43gpHTzsaa8/93x6u1zqBgzLBwnp+i7oVMjPVqxjklkEbDYJq1y+f/rznpFKUd8
NcIiB4UgLTUiSZG3IVA8iAKPWroh6tCzvjFtB+nlvTLSGeeXF0j02yUKV+/WCgh1
f0q4tWXCZGaRGGYqEXfd7YYFFddBz5Ka9U0suHzQoXqgmDb3i5cEZ9Vt/GTcpYBl
mmL0UOECgYEAughMxNalNdXidLtdKu+sPDp1NroPls5lQ3ptPD15roO9BRPJAxDL
OxF4S1y0gJW4EI9DaEgeCeSEDGQ2JjkhrR0e/L7mxkFkPF+824tx/scaEYAQBHb9
Avvcq4eHWQT7og3sl457OMUvtkcvAGCyBPy9i16ygaIq0qwUt7vlSlkCgYEAt+qq
u4D9Q0F3DwoFvi7kmwMUWA/1dbNBGAiIVdgj7WyTwTn1uzqGubBxPNgqqqJvwwhs
Bv1X0tTKY5tRPIn3u95PUu/F9C88ECj1db9gYwCzKe6ntZV1nPxQ8M8lLt/R3CcU
NRezT8Hse8pJfraste+qHHD58hXgqDzeZ0fwMfUCgYAwv/gOJQmKQBBl8quJkuEZ
r2AEBWIMbO3QbwatIJcAinlAGV01tnLrebqCVTrf71waytApRazJft6zuJcQESyo
BteV+BjVn1E7GQOOrM4kq9xC9cI8yUmoPIQpVwy64Tln0CpN1QKpb9L++0xv1ucP
s4OgQCKbIfoC1yFevJhrkQKBgD9zVGfP/pA/e6XSnVyZrQDVtSUUjGiI6UIzX2XO
Zca5mNgm+OIZNPXHK6oEIeQwmkI9G5flu3DfPNvUb9hk+PT1o4RHeJHf4ebpWpW+
6q/9Q9KJpY59+8+nNP1/WaKsUSiUyuHuRUyU6NNkXKq8tyUlhBi/2VtttM4WAdy7
8uApAoGBAImSUivGwSIjMDhkIr3hQwIPd10kAJOoyV4fX7U2JhX6A1ULUpxGW/12
k9gbrzu4DJfRV+YBSjiD6krBrNdS3jVmWDFJ1Wiky9v1QusQWpbUEuFgwAO6QJut
VLdDy2y4slDZ2nlA79/cLUh5niqX1vjp/HchA3gOavnPQFF9+Fj4
-----END RSA PRIVATE KEY-----
</key>

""",
                  (isProfileLoaded) => (val) {
                    setState(() {
                      txt2 = val;
                    });
                  },
                  (status){
                    print('new Val');
                    txt = status;
                  },
                );
              },
              child: Text('rPrwsd'),
            ),
            Text(txt),
            Text(txt2.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
