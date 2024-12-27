#!/bin/ash

TZ=${TZ:-UTC}
export TZ

cd /home/container
if [ $? -ne 0 ]; then
    echo "Failed to switch to /home/container directory, make sure the container image has a container user!".

    exit 1
fi

# parse the startup command from the Pterodactyl Panel so we can properly make use of it.
PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")

exec env ${PARSED}
