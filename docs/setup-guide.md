# Setup Guide

## 1. Overview

This guide documents the steps used to configure the Linux server for the project.

The setup covers:

* Initial server preparation
* User and permission management
* SSH configuration
* Firewall configuration
* Nginx installation and configuration
* Web content deployment
* Bash automation scripts
* Backup configuration
* Server verification

> **Note:** Commands and configuration should be adapted to the specific Linux distribution and environment being used. Mine is Ubuntu/Debian.

---

## 2. Prerequisites

Before beginning the setup, the following were required:

* A Linux server
* SSH access to the server
* A user account with `sudo` privileges
* Internet/network connectivity
* A local SSH client
* Basic Linux command-line knowledge

The project uses Linux command-line tools for server administration and configuration.

---

# 3. Initial Server Setup

## 3.1 Connect to the Server

Connect to the Linux server using SSH.

```bash
ssh devops@10.x.x.x
```

Verify that the connection was successful:

```bash
whoami
hostname
```

These commands confirm the current user and server hostname.

---

## 3.2 Update the Package Repository

Update the server's package information:

```bash
sudo apt update
```

Upgrade installed packages:

```bash
sudo apt upgrade -y
```

This ensures that the server starts with an updated package environment.

---

## 3.3 Verify System Information

Check the operating system:

```bash
cat /etc/os-release
```

Check the kernel:

```bash
uname -a
```

Check system uptime:

```bash
uptime
```

Or you could verify with combined commands:

```bash
hostname && uname -a && lscpu && free -h && df -h && ip addr
```

These commands provide basic information about the server environment.

---

# 4. User and Permission Management

## 4.1 Create an Administrative User

Create a dedicated user:

```bash
sudo adduser devops
```

Add the user to the `sudo` group:

```bash
sudo usermod -aG sudo devops
```

Verify group membership:

```bash
groups devops
```

I created another user representing an application/service user:

```bash
sudo adduser appuser
```

Verify:

```bash
id devops
id appuser
```

Users are responsible for:

```bash
devops
   ↓
Server administration

appuser
   ↓
Application ownership/management
```

---

## 4.2 Verify File Permissions

Linux permissions were inspected using:

```bash
ls -la
```

File ownership can be checked with:

```bash
ls -l
```

Permissions were adjusted where required using commands such as:

```bash
chmod
chown
```

The purpose of this step is to ensure that users and services have only the access required to perform their tasks.

---

# 5. SSH Configuration

## 5.1 Verify SSH Service

Check whether the SSH service is running:

```bash
sudo systemctl status ssh
```

If required, start the service:

```bash
sudo systemctl start ssh
```

Enable SSH to start automatically:

```bash
sudo systemctl enable ssh
```

---

## 5.2 Test SSH Access

From the client machine:

```bash
ssh devops@10.x.x.x
```

After connecting, verify the remote system:

```bash
hostname
whoami
```

Successful execution confirms that remote administration is working.

---

# 6. Firewall Configuration

## 6.1 Install UFW(Uncomplicated Firewall)

Install UFW if it is not already available:

```bash
sudo apt install ufw -y
```

Check its current status:

```bash
sudo ufw status
```

Enable UFW:

```bash
sudo ufw enable
```

Verify the firewall rules:

```bash
sudo ufw status verbose
```

---

## 6.2 Allow Required Services

Allow SSH:

```bash
sudo ufw allow 22/tcp
```

Allow HTTP:

```bash
sudo ufw allow 80/tcp
```

Check:

```bash
sudo ufw status numbered
```

---

# 7. Install Nginx

## 7.1 Install Nginx

Install the Nginx web server:

```bash
sudo apt install nginx -y
```

Check its status:

```bash
sudo systemctl status nginx
```

---

## 7.2 Enable Nginx

Enable Nginx to start automatically:

```bash
sudo systemctl enable nginx
```

If necessary, start it:

```bash
sudo systemctl start nginx
```

---

## 7.3 Verify Nginx

Check whether Nginx is listening on the expected port:

```bash
sudo ss -tulpn | grep nginx
```

Alternatively:

```bash
curl http://localhost
```

A successful response confirms that Nginx is serving HTTP requests.

---

# 8. Configure the Web Content

## 8.1 Create the Web Directory

Create a directory for the project website:

```bash
sudo mkdir -p /var/www/devops-demo
```

Assign appropriate ownership:

```bash
sudo chown -R $USER:$USER /var/www/devops-demo
```

---

## 8.2 Create the Web Page

Create the HTML file:

```bash
nano /var/www/devops-demo/index.html
```

Add the project web content.

Example:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Linux Server Administration</title>
</head>
<body>
    <h1>Linux Server Administration Project</h1>
    <p>Nginx is running successfully.</p>
</body>
</html>
```

Save the file and exit.

---

# 9. Configure Nginx

Create the Nginx server configuration:

```bash
sudo nano /etc/nginx/sites-available/devops-demo
```

Example configuration:

```nginx
server {
    listen 80;
    server_name _;

    root /var/www/devops-demo;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Create the symbolic link:

```bash
sudo ln -s /etc/nginx/sites-available/devops-demo \
/etc/nginx/sites-enabled/devops-demo
```

Test the Nginx configuration:

```bash
sudo nginx -t
```

Reload Nginx:

```bash
sudo systemctl reload nginx
```

---

# 10. Verify the Web Server

Test the website locally:

```bash
curl http://localhost
```

If the server has a reachable IP address, open the following in a browser:

```text
http://SERVER_IP
```

The configured web page should be displayed.

---

# 11. Create the Server Health Check Script

Create the script:

```bash
nano scripts/server_health.sh
```

The script is designed to collect basic server information such as:

* Hostname
* Uptime
* CPU information
* Memory usage
* Disk usage
* Network information
* Service status

Make the script executable:

```bash
chmod +x scripts/server_health.sh
```

Run the script:

```bash
./scripts/server_health.sh
```

The output can be captured as evidence in:

```text
screenshots/health-check.png
```

---

# 12. Create the Backup Script

Create the backup script:

```bash
nano scripts/backup.sh
```

The script is designed to create a compressed backup of the selected files or directories.

Make it executable:

```bash
chmod +x scripts/backup.sh
```

Run the backup:

```bash
./scripts/backup.sh
```

Verify that the backup was created:

```bash
ls -lh
```

A timestamped backup archive should be visible in the configured backup location.

---

# 13. Service Verification

After completing the configuration, verify the major services.

### Check SSH

```bash
sudo systemctl status ssh
```

### Check Nginx

```bash
sudo systemctl status nginx
```

### Check Firewall

```bash
sudo ufw status verbose
```

### Check Listening Ports

```bash
sudo ss -tulpn
```

### Check Server Resources

```bash
df -h
free -h
uptime
```

These checks confirm that the main components of the environment are functioning.

---

# 14. Final Validation

The following checklist was used to verify the completed environment:

| Component         | Verification                       |
| ----------------- | ---------------------------------- |
| Linux server      | System information confirmed       |
| User management   | User and sudo permissions verified |
| SSH               | Remote connection successful       |
| UFW               | Required ports allowed             |
| Nginx             | Service running                    |
| HTTP              | Web page accessible                |
| Bash health check | Script executes successfully       |
| Backup            | Backup archive created             |
| File permissions  | Ownership and permissions verified |

---

# 15. Project Evidence

Screenshots documenting the implementation are stored in:

```text
screenshots/
```

Relevant evidence includes:

* `server-info.png` — Linux server information
* `ssh.png` — Successful SSH connection
* `firewall.png` — UFW configuration
* `nginx.png` — Nginx service/web server
* `health-check.png` — Server health-check script
* `backup.png` — Backup script execution

These screenshots provide visual evidence of the configuration and verification steps documented in this guide.

---

# 16. Result

The completed setup provides a basic Linux server environment capable of:

* Remote administration through SSH
* User and permission management
* Firewall-based network access control
* HTTP web serving through Nginx
* Basic server health monitoring
* Automated file backups through Bash

The project establishes foundational Linux administration skills that can later be extended into cloud infrastructure, containerization, Infrastructure as Code, and CI/CD.
