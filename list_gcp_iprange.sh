#!/bin/bash
# Script provided by n0531m - https://gist.github.com/n0531m/f3714f6ad6ef738a3b0a
# https://cloud.google.com/compute/docs/faq#ipranges
#nslookup -q=TXT _cloud-netblocks.googleusercontent.com  8.8.8.8

for LINE in `dig txt _cloud-netblocks.googleusercontent.com +short | tr " " "\n" | grep include | cut -f 2 -d :`
do
	dig txt $LINE +short
done | tr " " "\n" | grep ip4  | cut -f 2 -d : | sort -n

# changing target to _spf.google.com, you can get a simliar range now for Google Apps mail servers.
# https://support.google.com/a/answer/60764
# changing it to _netblocks.google.com will help get all the ip ranges google uses for its services.
