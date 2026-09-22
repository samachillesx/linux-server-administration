# Security

## 1. Overview

Security is an important part of Linux server administration. In this project, basic security controls were implemented to reduce unnecessary access to the server and protect the services running on it.

The security configuration focused on:

* User and privilege management
* File ownership and permissions
* SSH access
* Firewall configuration
* Service exposure
* Software updates
* Basic security verification

The project uses a layered approach where access to the server and its services is controlled at multiple levels.

---

## 2. Security Objectives

The main security objectives were to:

* Restrict access to the Linux server
* Avoid unnecessary user privileges
* Control inbound network traffic
* Expose only required services
* Maintain appropriate file permissions
* Keep installed packages updated
* Verify that security controls are working as expected

---

# 3. User and Privilege Management

## 3.1 Dedicated User

A dedicated Linux user was created for administration instead of relying exclusively on the default account.

Example:

```bash
sudo adduser devops
```

The user was granted administrative privileges through the `sudo` group where required:

```bash
sudo usermod -aG sudo devops
```

User group membership can be verified with:

```bash
groups devops
```

Using individual user accounts makes it possible to manage administrative access more explicitly.

---

## 3.2 Sudo Privileges

Administrative commands were executed using `sudo` when elevated privileges were required.

For example:

```bash
sudo systemctl status nginx
```

and:

```bash
sudo ufw status
```

This avoids performing normal administration tasks as the root user.

The principle of least privilege was considered when assigning permissions.

---

# 4. File and Directory Permissions

Linux file permissions determine which users can read, write, or execute files.

Permissions were inspected using:

```bash
ls -la
```

and:

```bash
ls -lah
```

The ownership of files and directories can be checked with:

```bash
ls -l
```

Where necessary, ownership was changed using:

```bash
sudo chown
```

and permissions were modified using:

```bash
chmod
```

For example, Bash scripts require execute permissions before they can be run directly:

```bash
chmod +x scripts/server_health.sh
```

Permissions were configured according to the purpose of each file rather than granting unnecessary access.

---

# 5. SSH Security

SSH provides remote administrative access to the server and therefore represents an important security boundary.

The SSH service was verified using:

```bash
sudo systemctl status ssh
```

Remote access was tested using:

```bash
ssh username@SERVER_IP
```

The SSH port used in this project is:

```text
22/TCP
```

SSH access was also considered when configuring the firewall to ensure that remote administration was not accidentally blocked.

### SSH Key Authentication

Where SSH keys are used, a key pair can be generated with:

```bash
ssh-keygen -t ed25519
```

The public key can then be installed on the server for key-based authentication.

> Only document SSH key authentication as implemented if it was actually configured during this project.

---

# 6. Firewall Configuration

UFW (Uncomplicated Firewall) was used to control inbound network traffic.

The firewall status was checked with:

```bash
sudo ufw status verbose
```

Required services were explicitly allowed.

For SSH:

```bash
sudo ufw allow 22/tcp
```

For HTTP:

```bash
sudo ufw allow 80/tcp
```

The firewall was then enabled:

```bash
sudo ufw enable
```

The final configuration was verified with:

```bash
sudo ufw status numbered
```

### Allowed Services

| Port | Protocol | Service | Purpose               |
| ---: | -------- | ------- | --------------------- |
|   22 | TCP      | SSH     | Remote administration |
|   80 | TCP      | HTTP    | Web traffic           |

Only ports required by the project should be exposed.

---

# 7. Nginx Security

Nginx was configured to serve the project's web content.

The service status was checked using:

```bash
sudo systemctl status nginx
```

The Nginx configuration was validated with:

```bash
sudo nginx -t
```

After configuration changes, Nginx was reloaded:

```bash
sudo systemctl reload nginx
```

The server was checked to ensure that Nginx was listening only on the required web port.

Listening services can be inspected using:

```bash
sudo ss -tulpn
```

---

# 8. System Updates

Keeping the operating system and installed packages updated helps address known software vulnerabilities and bugs.

The package repository was updated using:

```bash
sudo apt update
```

Available package upgrades were installed using:

```bash
sudo apt upgrade -y
```

Updates should be performed regularly in a real server environment rather than only during initial setup.

---

# 9. Service Exposure

The server was checked for listening network services using:

```bash
sudo ss -tulpn
```

This provides visibility into which ports are currently being used.

The intended exposed services for this project are:

```text
SSH  → TCP 22
HTTP → TCP 80
```

Unnecessary services and ports should not be exposed to external networks.

---

# 10. Backup Security

The project includes a Bash backup script for creating backups of selected server configuration or project files.

Backups should be protected from unauthorized access because they may contain configuration information or other sensitive data.

The backup process should therefore consider:

* File ownership
* File permissions
* Backup storage location
* Retention
* Protection against accidental deletion

Backup files can be inspected using:

```bash
ls -lah /backups/
```

> The backup implementation in this project is intended as a basic demonstration and should not be considered a complete production backup strategy.

---

# 11. Security Verification

After configuring the server, the following checks can be performed.

### Check firewall

```bash
sudo ufw status verbose
```

### Check SSH

```bash
sudo systemctl status ssh
```

### Check Nginx

```bash
sudo systemctl status nginx
```

### Check listening ports

```bash
sudo ss -tulpn
```

### Check file permissions

```bash
ls -lah
```

### Check system updates

```bash
sudo apt update
```

These checks provide basic confirmation that the main security controls and services are operating as expected.

---

# 12. Security Checklist

| Security Area    | Implementation                                   | Status    |
| ---------------- | ------------------------------------------------ | --------- |
| User management  | Dedicated user configured                        | Completed |
| Sudo access      | Administrative privileges controlled with `sudo` | Completed |
| File permissions | Ownership and permissions reviewed               | Completed |
| SSH              | Remote administration configured                 | Completed |
| Firewall         | UFW configured                                   | Completed |
| SSH port         | TCP 22 allowed                                   | Completed |
| HTTP port        | TCP 80 allowed                                   | Completed |
| Nginx            | Service configuration validated                  | Completed |
| System updates   | Packages updated                                 | Completed |
| Listening ports  | Services inspected with `ss`                     | Completed |
| Backups          | Basic backup process implemented                 | Completed |

> Update the status column if a particular control was not actually implemented.

---

# 13. Security Limitations

This project demonstrates foundational server-security practices rather than a complete production security architecture.

The following areas could be improved in a future version:

* SSH key-only authentication
* Disabling password-based SSH authentication
* Fail2ban or equivalent brute-force protection
* HTTPS/TLS configuration
* Automated security updates
* Centralized logging
* Intrusion detection
* Vulnerability scanning
* Encrypted and off-server backups
* Backup retention policies
* Monitoring and alerting
* More restrictive firewall rules based on the actual deployment environment

These improvements would provide additional protection for a production-oriented server.

---

# 14. Future Security Improvements

As the project develops toward cloud and DevOps environments, security could be integrated further into the infrastructure and deployment process.

Potential improvements include:

```text
Linux Server
     │
     ├── SSH Key Authentication
     │
     ├── UFW Firewall
     │
     ├── HTTPS / TLS
     │
     ├── Fail2ban
     │
     ├── Centralized Logging
     │
     ├── Monitoring & Alerting
     │
     └── Automated Backups
```

Future projects can extend these principles into:

* AWS IAM
* Security Groups
* VPC network controls
* Secrets management
* Docker security
* Kubernetes security
* Terraform security practices
* CI/CD security

---

# 15. Summary

The security configuration for this project focused on establishing basic controls for a Linux server environment.

The main controls implemented were:

* Controlled user and administrative access
* Linux file permissions
* SSH remote administration
* UFW firewall rules
* Limited service exposure
* Nginx configuration validation
* Regular system updates
* Basic backup protection

These practices provide a foundation for securing Linux servers and introduce security concepts that can be expanded into more advanced Cloud and DevOps environments.
