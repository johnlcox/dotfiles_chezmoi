#!/bin/bash

# install Zulu Java on Debian/Ubuntu
# Instructions: https://docs.azul.com/core/zulu-openjdk/install/debian#install-from-azul-apt-repository 

# install the necessary dependencies
sudo apt-get -q update
sudo apt-get -yq install gnupg curl 

# add Azul's public key
sudo apt-key adv \
  --keyserver hkp://keyserver.ubuntu.com:80 \
  --recv-keys 0xB1998361219BD9C9

# download and install the package that adds 
# the Azul APT repository to the list of sources 
curl -O https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-3_all.deb

# install the package
sudo apt-get install ./zulu-repo_1.0.0-3_all.deb
rm ./zulu-repo_1.0.0-3_all.deb  

# update the package sources
sudo apt-get update

zulu_versions=(
	zulu11-jdk
	zulu17-jdk
)

# install Azul Zulu JDKs
sudo apt-get install -y ${zulu_versions[@]}

# add to jenv if present
if [ -d "$HOME/.jenv/bin" ]; then
  eval "$(jenv init -)"

  for zulu_version in "${zulu_versions[@]}"; do
    jdk_path="/usr/lib/jvm/${zulu_version%'-jdk'}"
    echo $jdk_path
    jenv add $jdk_path
  done
fi