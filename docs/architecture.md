# Architecture

## 1. Overview

This project demonstrates the setup and administration of a Linux server environment for basic web hosting, system administration, security, and automation.

The environment consists of a Linux server running Nginx as a web server, UFW as the host-based firewall, SSH for remote administration, and Bash scripts for basic server health monitoring and backups.

The project is designed to demonstrate foundational Linux and DevOps concepts that can be applied to cloud-based server environments.

---

## 2. Architecture Diagram

```text
                         ┌─────────────────────┐
                         │       User          │
                         │   Web Browser /     │
                         │    SSH Client       │
                         └──────────┬──────────┘
                                    │
                     ┌──────────────┴──────────────┐
                     │                             │
                  HTTP :80                      SSH :22
                     │                             │
                     ▼                             ▼
          ┌────────────────────────────────────────────┐
          │              Linux Server                  │
          │                                            │
          │  ┌──────────────┐     ┌────────────────┐  │
          │  │     UFW      │     │      SSH       │  │
          │  │   Firewall   │     │ Remote Access  │  │
          │  └──────┬───────┘     └────────────────┘  │
          │         │                                  │
          │         ▼                                  │
          │  ┌──────────────┐                          │
          │  │    Nginx     │                          │
          │  │ Web Server    │                          │
          │  └──────┬───────┘                          │
          │         │                                  │
          │         ▼                                  │
          │  ┌──────────────┐                          │
          │  │  Web Content │                          │
          │  │ HTML / Site  │                          │
          │  └──────────────┘                          │
          │                                            │
          │  ┌────────────────┐  ┌─────────────────┐  │
          │  │ Health Check   │  │ Backup Script   │  │
          │  │ Bash Script    │  │ Bash Script     │  │
          │  └────────────────┘  └─────────────────┘  │
          │                                            │
          └────────────────────────────────────────────┘
```

---

## 3. System Components

### 3.1 Linux Server

The Linux server provides the underlying operating environment for the project.

It is responsible for:

* Running system services
* Managing users and permissions
* Hosting the web server
* Providing remote administration through SSH
* Running administrative Bash scripts
* Managing files, processes, packages, and networking

Linux command-line tools are used throughout the project to administer and troubleshoot the server.

---

### 3.2 SSH

SSH (Secure Shell) provides secure remote access to the Linux server.

It allows an administrator to:

* Connect to the server remotely
* Execute Linux commands
* Manage files and services
* Configure the server
* Troubleshoot issues

The SSH service operates on TCP port `22` in this project.

---

### 3.3 UFW Firewall

UFW (Uncomplicated Firewall) is used as the host-based firewall.

The firewall controls which network connections are allowed to reach the server.

The project allows only the ports required by the services being used.

Example:

| Port | Protocol | Purpose                   |
| ---- | -------- | ------------------------- |
| 22   | TCP      | SSH remote administration |
| 80   | TCP      | HTTP web traffic          |

Unnecessary ports are not exposed as part of the project.

---

### 3.4 Nginx

Nginx is used as the web server.

Its primary role in this project is to receive HTTP requests and serve the project's web content.

The basic request flow is:

```text
Web Browser
     │
     │ HTTP Request
     ▼
  Port 80
     │
     ▼
   Nginx
     │
     ▼
Web Content
```

Nginx is managed as a Linux system service and can be started, stopped, restarted, and inspected using `systemctl`.

---

### 3.5 Bash Automation

Bash scripts are included to demonstrate basic Linux automation.

The project contains two primary scripts:

```text
scripts/
├── server_health.sh
└── backup.sh
```

#### `server_health.sh`

The health-check script provides basic information about the server and its current state.

Depending on the implementation, this can include:

* Hostname
* System uptime
* Disk usage
* Memory usage
* CPU information
* Network information
* Service status

#### `backup.sh`

The backup script demonstrates basic backup automation.

It is intended to:

* Identify the files or directories to back up
* Create a backup archive
* Include a timestamp
* Store the resulting backup
* Report whether the operation was successful

---

## 4. Network Architecture

The server exposes only the network services required for the project.

```text
                    Internet / Local Network
                             │
              ┌──────────────┴──────────────┐
              │                             │
           TCP :22                       TCP :80
              │                             │
              ▼                             ▼
            SSH                           Nginx
              │                             │
              ▼                             ▼
       Server Administration          Web Application
```

### Network Services

| Service | Port   | Purpose                      |
| ------- | ------ | ---------------------------- |
| SSH     | 22/TCP | Remote server administration |
| HTTP    | 80/TCP | Web server traffic           |

The firewall is positioned at the server level and controls access to these services.

---

## 5. Access and Request Flow

### Administrative Access

```text
Administrator
     │
     │ SSH
     ▼
UFW Firewall
     │
     ▼
Linux Server
     │
     ▼
Command Line
```

### Web Access

```text
User Browser
     │
     │ HTTP
     ▼
UFW Firewall
     │
     ▼
Nginx
     │
     ▼
Web Content
```

These two flows demonstrate the difference between **administrative access** and **application/web traffic**.

---

## 6. File and Project Structure

The project repository separates configuration, scripts, documentation, and evidence.

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
└── screenshots/
    ├── server-info.png
    ├── ssh.png
    ├── firewall.png
    ├── nginx.png
    └── health-check.png
```

This structure keeps the main README concise while providing separate documentation for configuration, security, troubleshooting, and project evidence.

---

## 7. Architecture Design Considerations

The architecture was intentionally kept simple to focus on fundamental Linux server administration concepts.

Key considerations include:

* **Security:** Restrict network access to required services.
* **Manageability:** Use SSH and standard Linux administration tools.
* **Automation:** Use Bash scripts for repetitive administrative tasks.
* **Separation of concerns:** Keep web server configuration, scripts, documentation, and evidence separated.
* **Reproducibility:** Document the setup process so the environment can be recreated.
* **Troubleshooting:** Record problems encountered during implementation and the steps used to resolve them.

---

## 8. Future Improvements

If this project were extended toward a more production-oriented environment, possible improvements would include:

* SSH key-based authentication
* HTTPS/TLS with a valid SSL certificate
* Automated backup scheduling
* Centralized logging
* Server monitoring and alerting
* Automated deployment
* Infrastructure as Code using Terraform
* Containerization using Docker
* Deployment to a cloud platform such as AWS
* CI/CD automation

These improvements are outside the scope of the current project but provide a path from basic Linux administration toward a more complete Cloud/DevOps environment.
