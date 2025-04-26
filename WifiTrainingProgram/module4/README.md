## Week 4 - MAC Layer and Fundamentals

### 1. Significance of MAC Layer and OSI Position
The MAC (Medium Access Control) layer is a sublayer of the Data Link Layer (Layer 2) in the OSI model. Its significance lies in controlling how data is placed onto and retrieved from the medium, ensuring that devices can access the network without collision and guaranteeing the reliable delivery of data frames. It serves as the bridge between the physical layer and higher layers.

### 2. 802.11 MAC Header Frame Format
- **Frame Control**: Indicates type (Management, Control, Data) and subtype.
- **Duration/ID**: Time for which the medium is reserved.
- **Addresses 1-4**: Source, Destination, BSSID, and sometimes relay.
- **Sequence Control**: Helps reorder frames.
- **QoS Control**: Indicates Quality of Service parameters.
- **HT Control**: Used for high-throughput capabilities.
Each field serves to properly route, prioritize, and control wireless communication.

### 3. MAC Layer Functionalities
- **Management**: Handles beacons, probing, authentication, association.
- **Control**: Manages RTS/CTS exchanges, acknowledgments.
- **Data**: Responsible for carrying user data, applying encryption and decryption.

### 4. Scanning Process and Types
- **Passive Scanning**: Clients listen for beacons.
- **Active Scanning**: Clients actively probe APs.
Scanning enables clients to discover available networks and evaluate signal strength and supported features.

### 5. Client Association Process
- Scan for networks
- Authenticate with a selected AP
- Associate by sending Association Request and receiving Response
- Start encryption negotiation via handshake if secured

### 6. EAPOL 4-Way Handshake Steps
1. **Message 1**: AP sends ANonce.
2. **Message 2**: Client replies with SNonce and derives PTK.
3. **Message 3**: AP sends the Group Temporal Key (GTK) encrypted.
4. **Message 4**: Client confirms receipt, completing authentication.
This ensures mutual proof of possession of the shared secret.

### 7. Power Saving Schemes in MAC Layer
- **Legacy Power Save**: Clients wake periodically at beacon intervals.
- **U-APSD**: Devices wake only for specific traffic.
- **TWT**: Wi-Fi 6 feature allowing pre-scheduled wake-ups.
Efficient power saving extends device battery life dramatically.

### 8. Medium Access Control Methodologies
- **CSMA/CA**: Devices sense before transmitting; wait if busy.
- **RTS/CTS**: Control frames used to reduce collision chance.
This ensures fair access among multiple devices.

### 9. Block ACK Mechanism
Block ACK aggregates multiple frame acknowledgments into one, reducing overhead and increasing throughput efficiency especially in high-bandwidth environments.

### 10. A-MSDU, A-MPDU, and A-MSDU in A-MPDU
- **A-MSDU**: Aggregates multiple data frames into a single MPDU.
- **A-MPDU**: Aggregates multiple MPDUs into a burst.
- **A-MSDU inside A-MPDU**: Combines both methods, maximizing throughput while retaining error resilience.
