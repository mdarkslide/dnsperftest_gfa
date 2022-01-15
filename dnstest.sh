#!/usr/bin/env bash

command -v bc > /dev/null || { echo "bc was not found. Please install bc."; exit 1; }
{ command -v drill > /dev/null && dig=drill; } || { command -v dig > /dev/null && dig=dig; } || { echo "dig was not found. Please install dnsutils."; exit 1; }



NAMESERVERS=`cat /etc/resolv.conf | grep ^nameserver | cut -d " " -f 2 | sed 's/\(.*\)/&#&/'`

PROVIDERS="
8.8.8.8#google_8888
8.8.4.4#google_8844
9.9.9.9#quad9
1.1.1.1#cloudflare_1111
1.0.0.1#cloudflare_1001
209.244.0.3#level3
208.67.222.222#ciscoumbrella
208.67.222.222#opendns
8.26.56.26#comodo
199.85.126.20#norton
176.103.130.130#adguard
185.228.168.168#cleanbrowsing
80.80.80.80#freenom
77.88.8.7#yandex
"

# Domains to test. Duplicated domains are ok
DOMAINS2TEST="www.google.com wl.primeraplus.com.mx outlook.office.com whatsapp.com www.oracle.com gfa-smartit.onbmc.com banorte.com www.conectagfa.com.mx twitter.com"


totaldomains=0
printf "%-18s" ""
for d in $DOMAINS2TEST; do
    totaldomains=$((totaldomains + 1))
    printf "%-8s" "test$totaldomains"
done
printf "%-8s" "Average"
echo ""


for p in $NAMESERVERS $PROVIDERS; do
    pip=${p%%#*}
    pname=${p##*#}
    ftime=0

    printf "%-18s" "$pname"
    for d in $DOMAINS2TEST; do
        ttime=`$dig +tries=1 +time=2 +stats @$pip $d |grep "Query time:" | cut -d : -f 2- | cut -d " " -f 2`
        if [ -z "$ttime" ]; then
	        #let's have time out be 1s = 1000ms
	        ttime=1000
        elif [ "x$ttime" = "x0" ]; then
	        ttime=1
	    fi

        printf "%-8s" "$ttime ms"
        ftime=$((ftime + ttime))
    done
    avg=`bc -lq <<< "scale=2; $ftime/$totaldomains"`

    echo "  $avg"
done


exit 0;
