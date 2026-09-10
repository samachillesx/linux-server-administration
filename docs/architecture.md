## Architecture 

```text 

Developer Machine | | SSH | Port 22 v +-----------------------+ | Ubuntu Server | | | | UFW Firewall | | / \ | | SSH HTTP | | 22 80 | | \ / | | \ / | | Nginx | | | | | Web Content | | | | Bash Automation | | ├── Health Check | | └── Backup | | | | systemd | | Services | +-----------------------+ | v Web Browser



### Server Information

```bash
hostname
uname -a
df -h
free -h
