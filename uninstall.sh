#!/data/data/com.termux/files/usr/bin/bash

# Colors
red='\033[1;31m'
green='\033[1;32m'
blue='\033[1;34m'
reset='\033[0m'

printf "${blue}[*] Starting Kali NetHunter uninstall...\n"

# Remove extracted Kali rootfs directories
printf "${blue}[*] Searching for extracted Kali folders...\n"
find $HOME -type d -name "kali*" -exec rm -rf {} \; 2>/dev/null
printf "${green}[✓] Removed extracted Kali directories\n"

# Remove tar.xz and sha files
printf "${blue}[*] Searching for downloaded tarballs and checksum files...\n"
find $HOME -type f \( -name "kali-nethunter-rootfs-*.tar.xz" -o -name "*.sha512sum" \) -exec rm -f {} \;
printf "${green}[✓] Removed downloaded rootfs and checksum files\n"

# Remove launcher script
LAUNCHER="$PREFIX/bin/startkali.sh"
if [ -f "$LAUNCHER" ]; then
    rm -f "$LAUNCHER"
    printf "${green}[✓] Removed launcher script: startkali.sh\n"
else
    printf "${yellow}[!] Launcher script not found, skipping\n"
fi

# Remove finaltouchup script if still present
if [ -f "$HOME/finaltouchup.sh" ]; then
    rm -f "$HOME/finaltouchup.sh"
    printf "${green}[✓] Removed finaltouchup.sh\n"
fi

printf "${green}\n[✓] Kali NetHunter has been completely uninstalled.\n"
printf "${reset}"
