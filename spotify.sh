#!/bin/bash

# Add Spotify GPG key and repository
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -

# Add Spotify repository
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Update package list and install Spotify client
sudo apt update && sudo apt-get -y install spotify-client

# Install Spicetify CLI
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh

# Grant necessary permissions to Spotify files
sudo chmod a+wr /usr/share/spotify
sudo chmod a+wr /usr/share/spotify/Apps -R
