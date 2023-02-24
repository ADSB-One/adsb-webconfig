#!/bin/bash

if [[ "$1" == "/boot/adsb-env" ]] || [[ "$1" == "/boot/adsb-978env" ]]; then
    sed -i -e "s|^RECEIVER_OPTIONS=.*$|RECEIVER_OPTIONS=\"$2\"|" "$1"
fi
