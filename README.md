<!-- LOGO -->
<h1>
<p align="center">
  <img src="https://github.com/user-attachments/assets/fe853809-ba8b-400b-83ab-a9a0da25be8a" alt="Ghostty Logo" width="128" style="margin-right: 20px">
  <img src="https://www.debian.org/logos/openlogo-nd.svg" alt="Debian Logo" width="104" style="margin-left: 20px">
  <br>Ghostty for Debian
</h1>
  <p align="center">
    👻 Ghostty is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration.
  </p>
</p>

<p align="center">
⭐⭐⭐ Love using Ghostty on Debian? Show your support by starring this repo! ⭐⭐⭐
</p>

# About

This repository contains Debian packaging for Ghostty, providing easy installation on Debian-based systems.

## Direct Downloads

- Debian 12 (Bookworm): [ghostty_1.0.0-1~13.gbp9c580a_amd64.deb](https://download.opensuse.org/repositories/home:/clayrisser:/bookworm/Debian_12/amd64/ghostty_1.0.0-1~13.gbp9c580a_amd64.deb)
- Debian 11 (Bullseye): [ghostty_1.0.0-1~13.gbp9c580a_amd64.deb](https://download.opensuse.org/repositories/home:/clayrisser:/bullseye/Debian_11/amd64/ghostty_1.0.0-1~13.gbp9c580a_amd64.deb)
- Debian Sid (Unstable): [ghostty_1.0.0-1~13.gbp9c580a_amd64.deb](https://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/amd64/ghostty_1.0.0-1~13.gbp9c580a_amd64.deb)

## Installation

### Debian 12 (Bookworm)

#### Option 1: Add Repository
```sh
echo 'deb http://download.opensuse.org/repositories/home:/clayrisser:/bookworm/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/home:clayrisser:bookworm.list
curl -fsSL https://download.opensuse.org/repositories/home:clayrisser:bookworm/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_clayrisser_bookworm.gpg > /dev/null
sudo apt update
sudo apt install ghostty
```

#### Option 2: Direct Download
Download and install the .deb package directly:
```sh
curl -LO https://download.opensuse.org/repositories/home:/clayrisser:/bookworm/Debian_12/amd64/ghostty_1.0.0-1~13.gbp9c580a_amd64.deb
sudo apt install ./ghostty_1.0.0-1~13.gbp9c580a_amd64.deb
```

### Debian 11 (Bullseye)

#### Option 1: Add Repository
```sh
echo 'deb http://download.opensuse.org/repositories/home:/clayrisser:/bullseye/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/home:clayrisser:bullseye.list
curl -fsSL https://download.opensuse.org/repositories/home:clayrisser:bullseye/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_clayrisser_bullseye.gpg > /dev/null
sudo apt update
sudo apt install ghostty
```

#### Option 2: Direct Download
Download and install the .deb package directly:
```sh
curl -LO https://download.opensuse.org/repositories/home:/clayrisser:/bullseye/Debian_11/amd64/ghostty_1.0.0-1~13.gbp9c580a_amd64.deb
sudo apt install ./ghostty_1.0.0-1~13.gbp9c580a_amd64.deb
```

### Debian Sid (Unstable)

#### Option 1: Add Repository
```sh
echo 'deb http://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/ /' | sudo tee /etc/apt/sources.list.d/home:clayrisser:sid.list
curl -fsSL https://download.opensuse.org/repositories/home:clayrisser:sid/Debian_Unstable/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_clayrisser_sid.gpg > /dev/null
sudo apt update
sudo apt install ghostty
```

#### Option 2: Direct Download
Download and install the .deb package directly:
```sh
curl -LO https://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/amd64/ghostty_1.0.0-1~13.gbp9c580a_amd64.deb
sudo apt install ./ghostty_1.0.0-1~13.gbp9c580a_amd64.deb
```

## Development

The packages are built using the [Open Build Service](https://build.opensuse.org/). You can find the project repositories here:
- [Bookworm](https://build.opensuse.org/project/show/home:clayrisser:bookworm)
- [Bullseye](https://build.opensuse.org/project/show/home:clayrisser:bullseye)
- [Sid](https://build.opensuse.org/project/show/home:clayrisser:sid)

## License

This packaging is licensed under the Apache License 2.0.
