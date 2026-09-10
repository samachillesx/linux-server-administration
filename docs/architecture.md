# Architecture 

The project consists of a single Ubuntu Linux server used for administration and web hosting.

## Server Information

After configuring your server, run:

```bash
hostname
cat /etc/os-release
uname -a
lscpu
free -h
df -h
ip addr

## Architecture Diagram

```text
                    Administrator
                         |
                         | SSH
                         v
                 +---------------+
                 | Ubuntu Server |
                 |               |
                 |   UFW         |
                 |    |          |
                 |  SSH :22      |
                 |  HTTP :80     |
                 |    |          |
                 |   Nginx       |
                 |    |          |
                 +----|----------+
                      |
                      v
                 Web Application
                 /var/www/devops-demo
