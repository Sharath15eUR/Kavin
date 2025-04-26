## Week 6 - Wi-Fi Security

### 1. Pillars of Wi-Fi Security
- **Authentication**: Ensures that only authorized users/devices can connect.
- **Confidentiality**: Protects transmitted data through encryption.
- **Integrity**: Guarantees that data is not altered during transmission.

### 2. Authentication vs Encryption in Wi-Fi Security
- **Authentication** verifies the identity of users or devices.
- **Encryption** protects data from being read by unauthorized parties, ensuring confidentiality.

### 3. Differences between WEP, WPA, WPA2, and WPA3
- **WEP**: Weak static key encryption (RC4), easily cracked.
- **WPA**: Introduced TKIP to enhance WEP security but still flawed.
- **WPA2**: Replaced TKIP with AES-based CCMP, offering strong security.
- **WPA3**: Introduced SAE, forward secrecy, and stronger protection against brute-force attacks.

### 4. Why WEP is Insecure
WEP uses static encryption keys and a flawed RC4 algorithm, making it vulnerable to packet sniffing and replay attacks, allowing attackers to easily crack the key.

### 5. Why WPA2 Was Introduced
WPA2 was introduced to eliminate the vulnerabilities of WEP and WPA by using stronger encryption (AES) and secure key management through CCMP.

### 6. Role of the Pairwise Master Key (PMK) in 4-Way Handshake
The PMK, derived from the network password or EAP authentication, forms the basis for generating the Pairwise Transient Key (PTK) used for encrypting the session between the client and AP.

### 7. How 4-Way Handshake Ensures Mutual Authentication
Both client and AP prove they possess the PMK without directly transmitting it by exchanging nonces and generating identical encryption keys, ensuring both sides trust each other.

### 8. What Happens with a Wrong Passphrase
If the passphrase is wrong, the derived keys during the handshake will mismatch, causing the handshake to fail and preventing the client from connecting to the network.

### 9. Problem Solved by 802.1X
802.1X solves the issue of unauthorized access by providing a framework for centralized authentication using RADIUS servers, supporting stronger user/device validation.

### 10. How 802.1X Enhances Wireless Security
It provides dynamic per-session encryption keys, strong user/device authentication using EAP methods, and prevents unauthorized access to the network even if SSIDs are known.
