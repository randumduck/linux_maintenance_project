# Ubuntu System Cleanup Script

This repository contains a Bash script designed to perform a comprehensive system cleanup on Ubuntu. It helps free up disk space, remove unnecessary files, and maintain overall system hygiene.

---

## 🧰 Features

- 🧹 Clears browser history and cache (Chrome and Firefox)
- 🗑️ Empties system Trash
- 🧊 Deletes system temp files
- 📦 Cleans APT cache
- 🧽 Removes orphaned packages
- 🖼️ Clears thumbnail cache
- 🔄 Removes old Snap versions
- 📄 Deletes user log files
- 📉 Clears system logs older than 7 days

---

## ✅ Prerequisites

- Ubuntu-based system
- `sqlite3` installed (for browser history cleanup)

Install `sqlite3` if not already installed:

```bash
sudo apt update
sudo apt install sqlite3
```

---

## 📦 Installation

1. Clone this repository or download the script.
2. Make the script executable:

```bash
chmod +x cleanup.sh
```

---

## 🚀 Usage

Run the script with:

```bash
./cleanup.sh
```

For full cleanup (including system-wide temp files), run with `sudo`:

```bash
sudo ./cleanup.sh
```

---

## 🧾 Task Breakdown

| Task                          | Description                                                                 |
|-------------------------------|-----------------------------------------------------------------------------|
| Chrome Cleanup                | Deletes browsing history and cache without affecting saved passwords       |
| Firefox Cleanup               | Clears history and cache while preserving login data                       |
| Temp Files                    | Deletes contents of `/tmp` and user cache directories                      |
| Trash                         | Empties the user's Trash folder                                            |
| APT Cache                     | Removes cached `.deb` packages from `/var/cache/apt/archives`              |
| Orphaned Packages             | Removes packages no longer required by any installed software              |
| Thumbnail Cache               | Deletes cached image thumbnails                                            |
| Snap Cleanup                  | Removes old, unused Snap package revisions                                 |
| User Logs                     | Deletes `.xsession-errors` and similar user log files                      |
| System Logs                   | Clears system logs older than 7 days using `journalctl`                    |

---

## 📄 License

This project is open-source and available under the MIT License.

---

## 🙌 Contributions

Feel free to fork the repo, submit issues, or open pull requests to improve the script!
