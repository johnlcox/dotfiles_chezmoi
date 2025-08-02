#!/usr/bin/env zsh

# install Temurin Java on Debian/Ubuntu
# Instructions: https://adoptium.net/installation/linux#_deb_installation_on_debian_or_ubuntu

# install the necessary dependencies
sudo apt install -y wget apt-transport-https gpg

# add Eclipse Adoptium GPG key
sudo wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null

# configure the Eclipse Adoptium apt repository
sudo echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | sudo tee /etc/apt/sources.list.d/adoptium.list

# update the package sources
sudo apt update

# Create an associative array of the common jdk version keys to brew package names
declare -A temurin_versions
temurin_versions[jdk11]=temurin-11-jdk
temurin_versions[jdk17]=temurin-17-jdk
temurin_versions[jdk21]=temurin-21-jdk

versions_to_install=()
for jdk_version in "$@"
do
    versions_to_install+=${temurin_versions[$jdk_version]}
done

# install Azul Zulu JDKs
sudo apt install -y ${versions_to_install[@]}

# add to jenv if present
if [ -d "$HOME/.jenv/bin" ]; then
  eval "$(jenv init -)"

  for version in "${versions_to_install[@]}"; do
    jdk_path="/usr/lib/jvm/${version%'-jdk'}"
    echo $jdk_path
    jenv add $jdk_path
  done
fi