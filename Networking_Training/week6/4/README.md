### 4. You are given three IP addresses: 192.168.10.5, 172.20.15.1, and 8.8.8.8.Identify the class of each IP address.Determine if it is private or public.Explain how NAT would handle a private IP when accessing the internet.


IP Classification & Public/Private Status
- 192.168.10.5 → Class C, Private
- 172.20.15.1 → Class B, Private
- 8.8.8.8 → Class A, Public

When a device with a private IP (e.g., 192.168.10.5 or 172.20.15.1) tries to access the internet, it cannot directly communicate because private IPs are not routable on the public internet. Network Address Translation (NAT) is used to solve this issue:

- The private IP address is translated into a public IP address (typically assigned to the router or firewall by the ISP).
- The router keeps a mapping of the private IP and port number to the assigned public IP and a dynamically assigned port.
- When the external server (e.g., Google’s DNS at 8.8.8.8) replies, the router checks the mapping and forwards the response to the correct private IP inside the network.

This allows multiple private devices to share a single public IP (via PAT - Port Address Translation) when accessing the internet.