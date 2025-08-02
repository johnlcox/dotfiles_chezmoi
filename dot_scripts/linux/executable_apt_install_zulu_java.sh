#!/usr/bin/env zsh

# install Zulu Java on Debian/Ubuntu
# Instructions: https://docs.azul.com/core/zulu-openjdk/install/debian#install-from-azul-apt-repository 

# install the necessary dependencies
sudo apt -q update
sudo apt -yq install gnupg curl 

# add Azul's public key
sudo apt-key adv \
  --keyserver hkp://keyserver.ubuntu.com:80 \
  --recv-keys 0xB1998361219BD9C9

# download and install the package that adds 
# the Azul APT repository to the list of sources 
curl -O https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-3_all.deb

# install the package
sudo apt install ./zulu-repo_1.0.0-3_all.deb
rm ./zulu-repo_1.0.0-3_all.deb  

# update the package sources
sudo apt update

# Create an associative array of the common jdk version keys to brew package names
declare -A zulu_versions
zulu_versions[jdk11]=zulu11-jdk
zulu_versions[jdk17]=zulu17-jdk
zulu_versions[jdk21]=zulu21-jdk

versions_to_install=()
for jdk_version in "$@"
do
    versions_to_install+=${zulu_versions[$jdk_version]}
done

# install Azul Zulu JDKs
sudo apt install -y ${versions_to_install[@]}

# add to jenv if present
if [ -d "$HOME/.jenv/bin" ]; then
  eval "$(jenv init -)"

  for zulu_version in "${versions_to_install[@]}"; do
    jdk_path="/usr/lib/jvm/${zulu_version%'-jdk'}"
    echo $jdk_path
    jenv add $jdk_path
  done
fi