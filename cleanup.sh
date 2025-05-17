#!/bin/bash

echo "Starting system cleanup..."

# Chrome: Clear history and cache (but keep login info and passwords)
CHROME_PROFILE="$HOME/.config/google-chrome/Default"
if [ -d "$CHROME_PROFILE" ]; then
    sqlite3 "$CHROME_PROFILE/History" "DELETE FROM urls;"
    sqlite3 "$CHROME_PROFILE/History" "DELETE FROM visits;"
    sqlite3 "$CHROME_PROFILE/History" "DELETE FROM visit_source;"
    rm -rf "$CHROME_PROFILE/Cache"/*
    rm -rf "$CHROME_PROFILE/Code Cache"/*
    echo "Chrome history and cache cleared."
fi

# Firefox: Clear history and cache (but keep login info and passwords)
FIREFOX_PROFILE=$(find "$HOME/.mozilla/firefox" -maxdepth 1 -type d -name "*.default-release" | head -n 1)
if [ -d "$FIREFOX_PROFILE" ]; then
    sqlite3 "$FIREFOX_PROFILE/places.sqlite" "DELETE FROM moz_places;"
    sqlite3 "$FIREFOX_PROFILE/places.sqlite" "DELETE FROM moz_historyvisits;"
    rm -rf "$FIREFOX_PROFILE/cache2"/*
    echo "Firefox history and cache cleared."
fi

# Clear system temp files
sudo rm -rf /tmp/*
rm -rf "$HOME/.cache/"*
echo "System temp files cleared."

# Empty Trash
rm -rf "$HOME/.local/share/Trash/files/"*
rm -rf "$HOME/.local/share/Trash/info/"*
echo "Trash emptied."

# Clean APT cache
sudo apt clean
echo "APT cache cleaned."

# Remove orphaned packages
sudo apt autoremove -y
echo "Orphaned packages removed."

# Clear thumbnail cache
rm -rf "$HOME/.cache/thumbnails/"*
echo "Thumbnail cache cleared."

# Remove old Snap versions
sudo snap list --all | awk '/disabled/ {print $1, $3}' | while read snapname revision; do
    sudo snap remove "$snapname" --revision="$revision"
done
echo "Old Snap versions removed."

# Remove user log files
rm -rf "$HOME/.xsession-errors"*
echo "User log files removed."

# Clear system logs older than 7 days
sudo journalctl --vacuum-time=7d
echo "Old system logs cleared (older than 7 days)."

echo "Cleanup complete."
