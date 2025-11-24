### Nmap
> Created Friday 22 August 2014

##### Default
1. most common 1000 ports
2. tcp/ip
3. 6 state open closed filtered
4. asterisk is allowed

- -iL from file
- -iR N, random number of hots
- --exclude CIDR
- --excludefile FILE
- -6 ipv6

###### Host discovery
- -sn list active hosts without port scanning,ping scan.
- -Pn treat hosts as online, no ping to port scan well
- -PS/PA/PU/PY portlist syn,ack udp, sctp [default port 80] [PU 40125[SANS]] 
- -PM [icmp address mask ping] -PE/-PP [ECHO/TIMESTAMP]
- -PO [protocol list number]
- -n/-R no dns resolve
- --dns-server custom dns
- --traceroute 
- -sL list hosts and dns reverse

##### Port scan
- -sS/sT/sA/sW/sM  TCP sync.connect.ack,window,maimon scans
- -sU UDP
- --scanflags
- -sI idle
- -sY/-sZ  sctp/cookies-echo
- --sO ip protocol

##### Ports
- -p 22; 1-255; U:53,25,46,T:456,123,S:9
- --top-ports [num]
- --port-ratio 0.0-1.0  1=all

##### Sevice
- -sV

##### OS
- -A == -O -sC --traceroute

##### Scripts
- -sC <=> --script=default
- --script-args=<n1=vl,n2=v2>
- --script-trace  show detail
- --script-updatedb
- --script-help=
- --script=ipidseq
> [222.184.56.250,254,255]

##### Firewall/IDS
- -f fragment
- -D decoy	
- -S source ip add
- -e interface
- -g source port
- --proxies url

##### Oupt
- -oX/-oN XML or normal
- -vvvvv verbosity
- --exclude  host1,host2
