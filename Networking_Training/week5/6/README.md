### You are given three IP addresses: 10.1.1.1, 172.16.5.10, and 192.168.1.5.
### Task: Identify the class of each IP address (Class A, B, or C). What is the default subnet mask for each class?


 

#### **1) IP Address: 10.1.1.1**  

- **Class A**: Class A IP addresses range from **1.0.0.0 to 126.255.255.255**.  

- The default subnet mask for Class A is 255.0.0.0 (/8), meaning the first octet (8 bits) represents the network, and the remaining 24 bits are for hosts.  

- Since **10.1.1.1** falls within this range, it belongs to Class A.  

#### **2) IP Address: 172.16.5.10**  

- **Class B**: Class B IP addresses range from **128.0.0.0 to 191.255.255.255**.  

- The default subnet mask for Class B is 255.255.0.0 (/16), meaning the first 16 bits represent the network, and the remaining 16 bits are for hosts.

- The IP 172.16.5.10 falls within this range and is also part of the **private IP range (172.16.0.0 - 172.31.255.255)**, commonly used in internal networks.  

#### **3) IP Address: 192.168.1.5**  

- **Class C**: Class C IP addresses range from **192.0.0.0 to 223.255.255.255**.  

- The default subnet mask for Class C is 255.255.255.0 (/24), meaning the first three octets (24 bits) represent the network, and the last 8 bits are for hosts.  

- The IP 192.168.1.5 falls within this range and is also a **private IP (192.168.0.0 - 192.168.255.255)**, commonly used in home and small business networks.  
