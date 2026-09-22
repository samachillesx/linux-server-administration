# Security

## 1. Overview

Security is a key part of managing and maintaining a Linux server. In this project, I applied a number of basic security controls to limit unnecessary access, reduce potential risks, and help protect the services running on the server.

The security configuration focused on the following areas:

* User and privilege management
* File ownership and permissions
* SSH access
* Firewall configuration
* Service exposure
* Software updates
* Basic security verification

For this project, I used a layered security approach, applying controls at different levels to manage access to the server and protect the services running on it.

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

I created a dedicated Linux user for server administration rather than relying solely on the default account. This provides better separation of administrative access and makes user permissions easier to manage.

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
ssh username@10.x.x.x
```

The SSH port used in this project is:

```text
22/TCP
```

When configuring the firewall, I made sure to allow SSH access so that remote administration would remain available and I would not accidentally lock myself out of the server.

### SSH Key Authentication

Where SSH keys are used, a key pair can be generated with:

```bash
ssh-keygen -t ed25519
```

I then installed the public key on the server to enable SSH key-based authentication. This provides a more secure way to access the server remotely without relying solely on password authentication.

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

I configured the firewall to allow only the ports required for the project, keeping unnecessary ports closed to reduce the server's exposure.

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

I checked the server to confirm that Nginx was listening only on the required web port. This helped ensure that no unnecessary ports were exposed to external connections.

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

I would ensure that system updates are performed regularly in a real server environment rather than only during the initial setup. Keeping the system up to date helps maintain security and reduces exposure to known vulnerabilities.

---

# 9. Service Exposure

I checked the server for listening network services using:

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

For this project, I created a Bash backup script to make copies of the Nginx configuration files. Since these backups may contain configuration details or other sensitive information, I also considered how they should be protected from unauthorized access.

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

---

# 11. Security Verification

After configuring the server, I performed the following checks.

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

---

# 13. Security Limitations

This project focuses on demonstrating the core server-security practices I implemented rather than providing a fully comprehensive, production-ready security architecture.

In a future version, I would look to strengthen the project in the following areas:

* SSH key-only authentication | Completed |
* Disabling password-based SSH authentication | Completed |
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

Implementing these improvements would make the server more secure and better prepared for the demands of a production environment.

---

# 14. Future Security Improvements

As I continue developing the project and move toward cloud and DevOps environments, I would integrate security more deeply into both the infrastructure and deployment process.

Potential improvements I would consider include:

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

For this project, I focused on putting basic but important security controls in place for a Linux server environment. The aim was to reduce common security risks and apply practical server-hardening techniques.

The main controls implemented were:

* Controlled user and administrative access
* Linux file permissions
* SSH remote administration
* UFW firewall rules
* Limited service exposure
* Nginx configuration validation
* Regular system updates
* Basic backup protection

Together, these measures provide a solid foundation for securing a Linux server. They also helped me build practical knowledge of security principles that can be further developed and applied in more advanced Cloud and DevOps environments.
