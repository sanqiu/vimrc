Content-Type: text/x-zim-wiki
Wiki-Format: zim 0.4
Creation-Date: 2015-01-03T09:39:00+08:00

====== Openvpn ======
Created Saturday 03 January 2015

ca: the certificates authorizition
.key : private
.crt : public

dh : diffie hellman
openssl dhparam --out dh2018.pem 2048

ipp.text ip pool : ip can be reassigned to the client after server or client restarted

hmac firewall to prevent dos attack and udp flood (provided by ssl/tls)
openvpn --genkey --secret ta.k
(this file will be on both sides, for server should be "tls-auth ta.key 0" and client "tls-auth ta.key 1" )

comp-lzo (should be on both side to enable compression)

max-clients( concurrent number)

verb:  verbosity

1. generate th ca (ca.key ,ca.crt)
  openssl req -nodes -new -x509 -keyout ca.key -out ca.crt
2.Using the ca to sign a server request to generate server cert 
 first ,generate the req: 
	openssl req -nodes -new -keyout server.key -out server.csr
second: sign the reqest with the ca:
	2
	
on client gernerate the csr for the ca to sign:
	openssl req -nodes -new -keyout client.key -out client.csr
now move the client.csr file to the server where the ca files are stored: and then sign the csr with the ca:
	openssl ca -out client.crt -in client.csr
now move the generated client.crt to your client where client.key is placed.
Right now all the cert and key for both server and client are created. 

now generate the diffie hellman file on the server: 
openssl dhparam -out dh2048.pem 2048

remenber the server.key,server.crt,dh2048 files' location (better placed in /etc/openvpn/)
 
now copy sample server.conf to /etc/openvpn/
and edit it server.conf:
	note the following lines:
	1. udp port
	2. dev tun
	3. ca, server keys ,dh2048 file location
	4. server gateway
	5. push redirect-gateway
	6. push dhcp-dns
	7. user group
	8. verbosity
vi /etc/sysctl.conf   net.ipv4.ip_forward = 1   ; sysctl -p

