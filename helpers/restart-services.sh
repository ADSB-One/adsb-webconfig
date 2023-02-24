#!/bin/bash

restartIfEnabled() {
    # check if enabled
    if systemctl is-enabled "$1" &>/dev/null; then
            systemctl restart "$1"
    fi
}

systemctl restart webconfig

adsb-first-run

services="readsb dump978-fa adsb-978 adsb-feed adsb-mlat webconfig leds"
for service in $services; do
    restartIfEnabled $service
done

systemctl start adsb-zt-enable
