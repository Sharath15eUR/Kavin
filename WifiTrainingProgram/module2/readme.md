# Wireless Networking Concepts

## 1. Split MAC Architecture and AP Performance  
Split MAC architecture divides MAC layer functions between the Access Point (AP) and the Wireless LAN Controller (WLC).  

- **AP Responsibilities**: Handles real-time operations such as beacon generation, RF monitoring, retransmissions, encryption, and decryption.  
- **WLC Responsibilities**: Manages control-plane functions like authentication, association requests, policy enforcement, and roaming.  

### **How it Improves AP Performance:**  
- Offloads processing-intensive tasks to WLC, allowing APs to be lightweight and cost-effective.  
- Reduces management complexity by centralizing control functions.  
- Improves roaming performance by handling mobility centrally.  

---

## 2. CAPWAP and AP-Controller Flow  
CAPWAP (Control and Provisioning of Wireless Access Points) is a protocol that encapsulates communication between the AP and WLC.  

### **CAPWAP Flow Between AP and Controller:**  
1. **Discovery Phase:** AP broadcasts discovery requests (Layer 2 or Layer 3) to find a WLC.  
2. **Join Phase:** AP authenticates and joins the controller.  
3. **Configuration Phase:** WLC provisions the AP with SSID, security policies, and VLAN details.  
4. **Data Transfer Phase:** AP forwards client traffic via CAPWAP tunnels to the WLC.  
5. **Keepalive Mechanism:** CAPWAP ensures the connection remains stable through control messages.  

---

## 3. CAPWAP in OSI Model and Tunnels  
- CAPWAP operates at **Layer 3 (Network Layer)** since it uses UDP for communication.  
- **Two Tunnels in CAPWAP:**  
  1. **Control Tunnel:** (UDP 5246) Used for AP-WLC management, authentication, and configuration.  
  2. **Data Tunnel:** (UDP 5247) Carries client data traffic to the WLC.  

**Purpose:** The split between control and data tunnels enhances security, scalability, and efficiency in centralized WLAN architectures.  

---

## 4. Lightweight APs vs. Cloud-based APs  
| Feature | Lightweight AP | Cloud-based AP |
|---------|---------------|---------------|
| **Management** | Requires WLC | Managed via cloud portal |
| **Traffic Handling** | CAPWAP tunnels to WLC | Direct traffic handling |
| **Deployment Cost** | Higher due to WLC | Lower, only AP needed |
| **Scalability** | Limited by WLC capacity | Highly scalable |
| **Flexibility** | Centralized | Distributed, can operate without local controller |  

**Key Difference:** Lightweight APs rely on an on-premises controller, while cloud-based APs connect to a cloud-hosted controller.  

---

## 5. How the CAPWAP Tunnel is Maintained  
- **Keepalive Messages:** WLC and AP exchange heartbeat messages to detect failures.  
- **DTLS Encryption:** Ensures secure communication over CAPWAP.  
- **AP Heartbeat Timer:** If no response is received within a set interval, the AP attempts to reconnect or switch to standalone mode (if supported).  

---

## 6. Sniffer Mode vs. Monitor Mode  
| Mode | Function | Use Case |
|------|----------|----------|
| **Sniffer Mode** | Captures and forwards raw 802.11 frames to a remote analyzer like Wireshark | Troubleshooting and packet analysis |
| **Monitor Mode** | AP scans all channels for rogue APs, interference, and security threats | Wireless intrusion detection and RF optimization |  

---

## 7. Best AP Mode for WAN-Based WLC Deployment  
When a WLC is deployed over the WAN, **FlexConnect Mode (HREAP Mode)** is preferred.  

### **Why FlexConnect?**  
- APs can function **locally** even if the WLC becomes unreachable.  
- Client authentication and data forwarding happen locally.  
- Reduces latency by avoiding CAPWAP data tunneling over WAN.  

---

## 8. Challenges of Deploying Autonomous APs in a Large Network  
1. **Scalability Issues:** Configuring and managing 50+ APs individually is complex.  
2. **Roaming Problems:** Clients experience session drops without centralized control.  
3. **SSID Consistency:** Each AP must be configured manually, increasing risk of misconfiguration.  
4. **Security Concerns:** No centralized authentication or policy enforcement.  
5. **Higher Maintenance Costs:** Requires constant monitoring and manual updates.  

**Solution:** Use a WLC or a cloud-managed solution for easier scalability and centralized management.  

---

## 9. Impact of WLC Failure on Local Mode APs  
- **In Local Mode:** APs depend entirely on the WLC for forwarding data.  
- If WLC **goes down**, local-mode APs:  
  - Stop forwarding client traffic.  
  - Drop all connected clients.  
  - Remain operational but wait for WLC recovery.  
  - Clients must reconnect once the WLC is back online.  

**Alternative:** Use **FlexConnect Mode** to allow local data forwarding in case of WLC failure.  
  
