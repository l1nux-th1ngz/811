#!/bin/bash

# Update package list
sudo apt update

# Install necessary development libraries and tools
sudo apt-get install -y \
    libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev \
    libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev \
    libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev \
    libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev \
    libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev \
    libxcb-xfixes0-dev libxext-dev meson ninja-build uthash-dev \
    xclip xdotool x11-xserver-utils dex kitty geany geany-plugins zenity yad

# Install additional fonts and utilities
sudo apt-get install -y \
    fonts-noto-mono fonts-ibm-plex dex lsb-release

# Install deb-get and Deborah using deb-get
curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get
sudo deb-get install deborah

# Clone and build picom from source
git clone https://github.com/dccsillag/picom.git
cd picom
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install
cd ..  # Return to the previous directory

# Install and enable SDDM (Simple Desktop Display Manager)
sudo apt-get install sddm --no-install-recommends -y
sudo systemctl enable sddm
sudo systemctl start sddm

# Clone the Pengurice repository and navigate to the packages directory
git clone --depth 1 https://github.com/p3nguin-kun/pengurice
cd pengurice/packages

# Open the debnyan.txt file for editing
nano debnyan.txt
