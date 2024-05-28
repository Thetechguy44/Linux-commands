import requests
import time
import os
# Define an array of URLs to visit
urls = [
    "https://examplemarket.com.ng/",
    "https://examplemarket.com.ng/product/dell-big-monitor-screen-2",
    "https://examplemarket.com.ng/product/rubiks-cube",
]

# Define the number of seconds to stay on each site
duration_seconds_per_site = 60

# Iterate through the URLs
for url in urls:
    # Use ProxyChains to route requests through your configured proxy servers
    proxychains_command = f"proxychains -q -f /etc/proxychains.conf"
    command = f"{proxychains_command} curl -s -I {url}"  # Use curl to make requests

    # Execute the command
    response = os.popen(command).read()
    print(f"Visited {url}")
    # Add additional logic or processing here if needed
    time.sleep(duration_seconds_per_site)

# After visiting all URLs for the specified duration, the script will exit
