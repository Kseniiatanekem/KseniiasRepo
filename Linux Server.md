# Project Documentation

## Setting up Linux Infrastructure for the Library

### Project Context

A local library is considering transitioning to Linux as its primary operating system. To demonstrate the potential of a Linux server, an internal infrastructure has been created using Ubuntu Server and Ubuntu Desktop, connected through a VirtualBox network. The configuration is set up to operate within an isolated network, enabling a secure and user-friendly environment for library staff and visitors.

---

## Infrastructure Goals and Objectives

The main goals of setting up the infrastructure:

- Ensure convenient and secure access to internal library resources.
- Automate network and system administration.
- Simplify backup processes and protect data from loss.
- Provide workstations equipped with necessary software for library staff's daily operations.

---

## 1. Network Configuration

### Goal and Objectives

**Goal**: Establish an isolated network for stable and secure operations of all servers and workstations.

**Objectives**:

- **Network Isolation** using VirtualBox (in `Internal Network` mode) separates library systems from external networks, reducing the risk of external threats and ensuring a secure environment for data handling.
- **Static IP Address on the Server** simplifies access to all main services like DHCP, DNS, and the web server, ensuring network reliability.
- **Configuration via VirtualBox** allows for testing changes without disrupting main network operations.

### VirtualBox Network Configuration

- **Server and Workstation** are connected through **Internal Network** for secure interaction.
- **Adapter 1**: `Internal Network` mode for connections between virtual machines.
- **Adapter 2**: Internet connection through a bridged network adapter for server updates and configuration.

### Static IP Configuration

IP configuration is done using Netplan. The server has a static IP set as follows:

```yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    enp0s3:
      dhcp4: no
      addresses:
        - 192.168.0.1/24
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4
```

Applying the configuration:
```bash
sudo netplan apply
```

---

## 2. DHCP Server Configuration

### Goal and Objectives

**Goal**: Automate the process of assigning IP addresses to all devices in the library's local network.

**Objectives**:

- **Automatic IP Allocation** eliminates the need for manual configuration on each device, simplifying the addition of new workstations.
- **IP Pool Management** via DHCP reduces the likelihood of conflicts and allows devices to automatically obtain addresses and DNS settings.

### Installation and Setup

Installing the DHCP server:
```bash
sudo apt update
sudo apt install isc-dhcp-server
```

DHCP configuration:
```bash
sudo nano /etc/dhcp/dhcpd.conf
```

Sample configuration:
```conf
subnet 192.168.0.0 netmask 255.255.255.0 {
  range 192.168.0.100 192.168.0.200;
  option routers 192.168.0.238;
  option domain-name-servers localnet;
  default-lease-time 600;
  max-lease-time 7200;
}
```

Restarting and enabling DHCP:
```bash
sudo systemctl restart isc-dhcp-server
sudo systemctl enable isc-dhcp-server
```

---

## 3. DNS Server Configuration

### Goal and Objectives

**Goal**: Simplify access to internal library resources by using names instead of IP addresses.

**Objectives**:

- **Translation of Domain Names to IP Addresses** for easy access to resources within the network.
- **Network Zone Creation** for library resources, making navigation easier and improving performance.

### Installation and Setup

Installing BIND9:
```bash
sudo apt install bind9
```

Zone configuration:
```bash
sudo nano /etc/bind/named.conf.local
```

Sample zone configuration:
```conf
zone "library.local" {
  type master;
  file "/etc/bind/zones/db.library.local";
}
```

Creating the zone file:
```bash
sudo mkdir -p /etc/bind/zones
sudo nano /etc/bind/zones/db.library.local
```

Zone file contents:
```conf
$TTL 604800
@   IN  SOA ns.library.local. admin.library.local. (
         2        ; Serial
         604800    ; Refresh
         86400     ; Retry
         2419200   ; Expire
         604800 )  ; Negative Cache TTL
@       IN  NS  ns.library.local.
ns      IN  A   192.168.0.1
```

Restarting the service:
```bash
sudo systemctl restart bind9
sudo systemctl enable bind9
```

---

## 4. Configuring the Nginx Web Server

### Goal and Objectives

**Goal**: Provide access to library web resources within the internal network.

**Objectives**:

- **Publishing Internal Pages** and creating a user-friendly interface for staff and visitors.
- **Local Domain Configuration** allows access to the server using a simple name `library.local`, simplifying access.

### Installation and Setup

Installing Nginx:
```bash
sudo apt install nginx
```

Local site configuration:
```bash
sudo nano /etc/nginx/sites-available/library
```

Site configuration:
```conf
server {
  listen 80;
  server_name library.local;
  root /var/www/library;
  index index.html;
}
```

Creating the directory and a test page:
```bash
sudo mkdir -p /var/www/library
echo "<h1>Welcome to the Library Server</h1>" | sudo tee /var/www/library/index.html
```

Activating the site and restarting Nginx:
```bash
sudo ln -s /etc/nginx/sites-available/library /etc/nginx/sites-enabled/
sudo systemctl restart nginx
```

---

## 5. SSH Configuration for Remote Management

### Goal and Objectives

**Goal**: Enable secure remote management of the server and workstations.

**Objectives**:

- **Remote Administration** allows administrators to manage the system without physical access to the server.
- **Secure Server Access** with encryption to prevent unauthorized access.

### Installation and Setup

Checking and installing SSH:
```bash
sudo apt install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
```

---

## 6. Backup Configuration

### Goal and Objectives

**Goal**: Protect data and configuration from loss by setting up regular backups.

**Objectives**:

- **Automated Backup** reduces the risk of data loss and ensures fast recovery.
- **Saving Configurations** for DHCP, DNS, and Nginx enables quick restoration of settings in case of a failure.

### Configuring Cron for Automated Backup

Opening Crontab:
```bash
sudo crontab -e
```

Adding a backup job:
```cron
0 2 * * 1 tar -czvf /backup/config_backup_$(date +\%F).tar.gz /etc/dhcp /etc/bind /etc/nginx
```

---

## 7. Workstation Setup

### Goal and Objectives

**Goal**: Equip library staff with essential software and access to internal resources.

**Objectives**:

- **Installing Office and Graphics Software** enables staff to work with documents and images.
- **DHCP Setup** for automatic IP address assignment simplifies network connection.

### Software Installation

Installing LibreOffice and GIMP:
```bash
sudo apt update
sudo apt install libreoffice gimp firefox
```

---

## Conclusion

The configured Linux infrastructure for the library brings together all essential services for effective network management, simplifies access to internal resources, and ensures reliable service operation.