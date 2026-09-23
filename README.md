# Linux Server Administration

I provisioned and administered an **Ubuntu Linux server** running as a VirtualBox virtual machine, implementing SSH-based remote administration, user and file permission management, UFW firewall rules, Nginx web server configuration, and system service management.

I also automated server health checks and configuration backups using **Bash**, while documenting the configuration, troubleshooting, verification steps, and project evidence throughout the process.

The project was built as a practical **Linux and DevOps foundation project**, providing hands-on experience with core server administration concepts that extend into cloud infrastructure, automation, and CI/CD.

## 🎯 Project Overview

For this project, I provisioned an **Ubuntu Server virtual machine using VirtualBox** and configured the environment from the command line.

Two additional users were created for specific purposes:

| User          | Purpose                               |
| ------------- | ------------------------------------- |
| `samachilles` | Primary server administration         |
| `devops`      | SSH access verification               |
| `appuser`     | Application ownership and permissions |

The actual server administration and configuration work was carried out under `samachilles`.

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

| Category        | Tools                  | Purpose
| --------------- | ---------------------- | ----------------------                          |
| OS              | Ubuntu Server          | 	Linux server environment                       |
| Virtualization  | VirtualBox             | Virtual machine platform                        |
| Web Server      | Nginx                  | Web server and HTTP services                    |
| Security        | UFW, OpenSSH           | Firewall configuration and secure remote access |
| Automation      | Bash, Cron             | Server scripting and scheduled tasks            |
| Services        | systemd                | 	Service and process management                 |
| Networking      | TCP/IP, DNS, SSH, HTTP | 	Network communication and connectivity         |
| Monitoring      | htop, ps, free, df, ss | 	System and network monitoring                  |
| Version Control | Git / GitHub           | Version control and project documentation       |

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
│   └── server-block.conf
│
├── screenshots/
│   ├── 01-server-info.png
│   ├── 02-ssh.png
│   ├── 04-firewall.png
│   ├── 05-nginx.png
│   ├── 08-nginx-web.png
│   ├── 09-server-health.png
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
