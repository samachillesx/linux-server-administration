# Troubleshooting

## Overview

During the project, I encountered several issues while working with Linux permissions, file locations, and Nginx configuration. These issues provided practical experience with troubleshooting server environments.

The general troubleshooting approach was:

```text
Problem
   ↓
Check the error
   ↓
Inspect permissions / paths / configuration
   ↓
Apply a fix
   ↓
Test the result
```

---

## 1. Permission Denied When Changing File Permissions

### Problem

I attempted to change the permissions of `/opt/myapp/app.log`:

```bash
chmod 640 /opt/myapp/app.log
```

The operation failed because my user did not have sufficient permission to modify the file.

### Resolution

I repeated the command with elevated privileges:

```bash
sudo chmod 640 /opt/myapp/app.log
```

The command completed successfully.

### Lesson

Linux permissions determine who can modify files and directories. When an operation requires administrative privileges, `sudo` may be necessary.

I also learned to inspect file ownership and permissions before assuming that a command is incorrect:

```bash
ls -l /opt/myapp/app.log
```

---

## 2. Creating Web Content in the Wrong Directory

### Problem

While creating the custom website, I navigated to:

```bash
cd /var/www
```

I then created the `web-content` directory but forgot to change into it before attempting to create `index.html`.

This caused confusion because I was working from the wrong directory.

I also encountered permission restrictions when working under `/var/www`.

### Resolution

I checked my current location with:

```bash
pwd
```

I then navigated into the correct directory:

```bash
cd /var/www/web-content
```

Where administrative privileges were required, I used `sudo`.

### Lesson

The `pwd` command is useful when working with multiple directories because it confirms the current working directory.

Before creating or modifying files, I learned to verify:

```bash
pwd
ls -la
```

This simple check can prevent mistakes caused by working in the wrong location.

---

## 3. Custom Webpage Was Not Being Served by Nginx

### Problem

After creating my custom webpage, I initially expected to access it directly using:

```bash
curl http://index.html
```

This did not work.

### Investigation

I learned that Nginx does not automatically serve every file created under `/var/www`.

Nginx needs a server block that defines:

* Which port to listen on
* Which directory contains the website
* Which file should be used as the index
* How incoming requests should be handled

### Resolution

I created a custom Nginx server block and configured its document root to point to the directory containing the webpage.

I then tested the configuration:

```bash
sudo nginx -t
```

and reloaded Nginx:

```bash
sudo systemctl reload nginx
```

The webpage could then be accessed through the server's HTTP endpoint.

### Lesson

I learned the difference between **creating web content** and **configuring a web server to serve that content**.

---

## 4. Incorrect Nginx Symbolic Link

### Problem

I initially created my Nginx server block while working inside:

```text
/etc/nginx/sites-enabled/
```

I then created a symbolic link using:

```bash
sudo ln -s server-block /etc/nginx/sites-enabled/server-block
```

This resulted in an incorrect/broken link because the source path pointed to the wrong location.

### Resolution

I removed the broken symbolic link:

```bash
sudo rm /etc/nginx/sites-enabled/server-block
```

I then created the symbolic link correctly from `sites-available`:

```bash
sudo ln -s /etc/nginx/sites-available/server-block \
/etc/nginx/sites-enabled/server-block
```

I verified the configuration:

```bash
sudo nginx -t
```

### Lesson

I learned the purpose of the two Nginx configuration directories:

```text
/etc/nginx/sites-available/
        │
        │ configuration files
        ▼
/etc/nginx/sites-enabled/
        │
        │ symbolic links to active configurations
        ▼
      Nginx
```

The actual configuration is stored in `sites-available`, while `sites-enabled` contains symbolic links to configurations that should be active.

---

## 5. Default Nginx Configuration Conflict

### Problem

The default Nginx configuration was still enabled while my custom `server-block` was also configured to listen on port `80`.

This created a conflict between the default configuration and my custom configuration.

### Resolution

I removed the default enabled configuration:

```bash
sudo rm /etc/nginx/sites-enabled/default
```

I then tested the Nginx configuration:

```bash
sudo nginx -t
```

and reloaded Nginx:

```bash
sudo systemctl reload nginx
```

### Lesson

I learned that Nginx can have multiple server blocks, but their configurations must be understood carefully, particularly when they listen on the same port.

I also learned why removing or disabling the default configuration can be useful when creating a dedicated server block for a simple single-site project.

---

## Troubleshooting Summary

The issues encountered in this project were primarily related to:

| Issue                        | Root Cause                                     | Solution                                  |
| ---------------------------- | ---------------------------------------------- | ----------------------------------------- |
| Permission denied            | Insufficient privileges                        | Used `sudo` and checked permissions       |
| Wrong web directory          | Incorrect working directory                    | Used `pwd` and `cd`                       |
| Webpage not served           | Nginx was not configured for the new directory | Created a server block                    |
| Broken symbolic link         | Incorrect source path                          | Recreated the link from `sites-available` |
| Nginx configuration conflict | Default and custom configurations both active  | Removed the default enabled configuration |

These problems reinforced the importance of checking **permissions, paths, service configuration, and error messages** before changing system settings.
