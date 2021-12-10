#!/usr/bin/env zsh

# Tap the zulu casks from https://github.com/mdogan/homebrew-zulu
brew tap mdogan/zulu

zulu_versions=(
	zulu-jdk11
	zulu-jdk17
)

brew upgrade --cask ${casks[@]}


# add to jenv if present
if [ -d "$HOME/.jenv/bin" ]; then
  eval "$(jenv init -)"

  for zulu_version in "${zulu_versions[@]}"; do
    jdk_path="/Library/Java/JavaVirtualMachines/${zulu_version%'-jdk'}.jdk/Contents/Home"
    echo $jdk_path
    # jenv add $jdk_path
  done
fi