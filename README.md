# Linux Server Administration

A hands-on Linux server administration project demonstrating core system administration, security, networking, web server configuration, monitoring, logging, and Bash automation skills.

The project was built on **Ubuntu Server** and documented as a practical DevOps foundation project.

## 🎯 Project Objectives

* Administer a Linux server from the command line
* Manage users, groups, packages, permissions, and services
* Configure and secure SSH access
* Configure a firewall using UFW
* Deploy and configure Nginx
* Monitor system resources and network activity
* Inspect and troubleshoot system and application logs
* Automate health checks and backups with Bash
* Document common infrastructure troubleshooting scenarios

## 🛠️ Technologies & Tools

| Category        | Tools                  |
| --------------- | ---------------------- |
| OS              | Ubuntu Server          |
| Web Server      | Nginx                  |
| Security        | UFW, SSH               |
| Automation      | Bash, Cron             |
| Services        | systemd                |
| Networking      | TCP/IP, DNS, SSH, HTTP |
| Monitoring      | htop, ps, free, df, ss |
| Version Control | Git                    |

## 🏗️ Project Structure

```text
linux-server-administration/
│
├── README.md
│
├── docs/
│   ├── architecture.md
│   ├── setup-guide.md
│   ├── security.md
│   ├── troubleshooting.md
│   └── lessons-learned.md
│
├── scripts/
│   ├── server_health.sh
│   └── backup.sh
│
├── nginx/
│   └── devops-demo.conf
│
├── screenshots/
│   ├── 01-server-info.png
│   ├── 02-ssh.png
│   ├── 03-users-permissions.png
│   ├── 04-firewall.png
│   ├── 05-nginx.png
│   ├── 06-services.png
│   ├── 07-networking.png
│   ├── 08-logs.png
│   ├── 09-health-check.png
│   └── 10-backup.png
│
└── .gitignore
```

## 🔧 What I Implemented

### Linux Administration

* Inspected system hardware and operating system information
* Managed packages with APT
* Created users and groups
* Configured file ownership and permissions
* Managed processes and system resources

### Server Security

* Configured SSH access
* Implemented SSH key authentication
* Configured UFW firewall rules
* Restricted unnecessary network access
* Applied basic Linux security practices

### Web Server

* Installed and configured Nginx
* Created a custom web page
* Configured an Nginx server block
* Validated and reloaded the configuration
* Tested HTTP connectivity

### Monitoring & Troubleshooting

* Monitored CPU, memory, disk, and processes
* Inspected open network ports
* Reviewed system and Nginx logs
* Diagnosed service and configuration issues
* Documented troubleshooting procedures

### Automation

* Created a Bash server health-check script
* Created a backup script
* Configured scheduled tasks using Cron

## 📸 Project Evidence

Selected screenshots demonstrate the main stages of the project:

* Server configuration
* SSH access
* Firewall configuration
* Nginx deployment
* Log investigation
* Automated health checks

Detailed evidence and implementation notes are available in the [`docs/`](docs/) directory.

## 📚 Documentation

| Document                                   | Description                                        |
| ------------------------------------------ | -------------------------------------------------- |
| [Architecture](docs/architecture.md)       | Server architecture and component relationships    |
| [Setup Guide](docs/setup-guide.md)         | Step-by-step implementation                        |
| [Security](docs/security.md)               | SSH, firewall, permissions, and security practices |
| [Troubleshooting](docs/troubleshooting.md) | Problems encountered, investigation, and fixes     |
| [Lessons Learned](docs/lessons-learned.md) | Key technical and DevOps takeaways                 |

## 🚀 Skills Demonstrated

This project demonstrates practical experience with:

**Linux Administration · Bash Scripting · SSH · Networking · TCP/IP · DNS · HTTP · Nginx · UFW · systemd · Cron · Git · Troubleshooting · Monitoring · Logging**

## 💡 DevOps Relevance

This project establishes the Linux and infrastructure fundamentals required for more advanced DevOps work.

The skills developed here provide a foundation for subsequent projects involving:

**Docker → Kubernetes → Jenkins CI/CD → Terraform → AWS → Cloud DevOps**

## ⚠️ Security

No private keys, passwords, API tokens, credentials, or other sensitive information are included in this repository.

All commands and configurations are provided for educational and portfolio purposes.
