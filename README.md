<!-- LOGO -->
<h1>
  <p align="center">
    <a href="https://ghostty.org/"><img src="https://github.com/user-attachments/assets/fe853809-ba8b-400b-83ab-a9a0da25be8a" alt="Ghostty Logo" width="128" style="margin-right: 20px"></a>
    <a href="https://www.debian.org/"><img src="https://www.debian.org/logos/openlogo-nd.svg" alt="Debian Logo" width="104" style="margin-left: 20px"></a>
    <br>Ghostty for Debian
    <br><i>& Ubuntu</i>
  </p>
</h1>
<p align="center">
  👻 Ghostty is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration.
</p>

<p align="center">
⭐⭐⭐ Love using Ghostty on Debian? Show your support by starring this repo! ⭐⭐⭐
</p>

<h4 align="center">
    <p>
      <a href="https://github.com/clayrisser/debian-zig">
        <img src="https://avatars.githubusercontent.com/u/27973237?s=200&v=4" alt="Zig Logo" width="48" style="margin-right: 12px">
        <img src="https://www.debian.org/logos/openlogo-nd.svg" alt="Debian Logo" width="39" style="margin-left: 12px">
        <br>Zig for Debian
      </a>
    </p>
</h4>
<p align="center">
  <i>Ghostty is built using Zig, a powerful systems programming language. Check out my Debian package for Zig above.</i>
</p>

# About

This repository contains Debian packaging for Ghostty.

## Installation

### Debian 12 (Bookworm) / *Ubuntu 22.04 LTS (Jammy)*

**repository installation**

```sh
echo 'deb http://download.opensuse.org/repositories/home:/clayrisser:/bookworm/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/home:clayrisser:bookworm.list
curl -fsSL https://download.opensuse.org/repositories/home:clayrisser:bookworm/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_clayrisser_bookworm.gpg > /dev/null
sudo apt update
sudo apt install ghostty
```

**direct installation**

```sh
ARCH="$(dpkg --print-architecture)"
curl -LO https://download.opensuse.org/repositories/home:/clayrisser:/bookworm/Debian_12/$ARCH/ghostty_1.1.3-1_$ARCH.deb
sudo apt install ./ghostty_1.1.3-1_$ARCH.deb
```

### Debian 13 (Trixie), Debian Sid (Unstable) / *Ubuntu 24.04 LTS (Noble)*

**repository installation**

```sh
curl -fsSL https://download.opensuse.org/repositories/home:clayrisser:sid/Debian_Unstable/Release.key | gpg --dearmor | sudo tee /etc/apt/keyrings/home_clayrisser_sid.gpg > /dev/null
ARCH="$(dpkg --print-architecture)"
sudo tee /etc/apt/sources.list.d/home:clayrisser:sid.sources > /dev/null <<EOF
Types: deb
URIs: http://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/
Suites: /
Architectures: $ARCH
Signed-By: /etc/apt/keyrings/home_clayrisser_sid.gpg
EOF
sudo apt update
sudo apt install ghostty
```

**direct installation**

```sh
ARCH="$(dpkg --print-architecture)"
curl -LO https://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/$ARCH/ghostty_1.1.3-3_$ARCH.deb
sudo apt install ./ghostty_1.1.3-3_$ARCH.deb
```

## Downloads

- Debian 12 (Bookworm): [ghostty_1.1.3-1_amd64.deb](https://download.opensuse.org/repositories/home:/clayrisser:/bookworm/Debian_12/amd64/ghostty_1.1.3-1_amd64.deb)
- Debian Sid (Unstable): [ghostty_1.1.3-3_amd64.deb](https://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/amd64/ghostty_1.1.3-3_amd64.deb), [ghostty_1.1.3-3_arm64.deb](https://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/arm64/ghostty_1.1.3-3_arm64.deb)

## Troubleshooting

### APT Sources Error

If you get an error like:
```
Error: Malformed entry 1 in sources file /etc/apt/sources.list.d/home:clayrisser:sid.sources (absolute Suite Component)
```

This is because OBS repositories use a flat structure and don't need the `Components:` field. Make sure your sources file doesn't contain `Components: main`.

## Builds

The packages are built using the [Open Build Service](https://build.opensuse.org/).
- [Bookworm](https://build.opensuse.org/project/show/home:clayrisser:bookworm)
- [Sid](https://build.opensuse.org/project/show/home:clayrisser:sid)
