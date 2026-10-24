# Cyber Kali Linux — CWU Browser GUI Lab

A browser-accessible Kali Linux XFCE desktop for Cyber World University learning labs.

## Architecture

GitHub repository → GitHub Codespaces → Kali Linux container → XFCE desktop → noVNC → browser

## Start

1. Open this repository on GitHub.
2. Choose **Code → Codespaces → Create codespace on main**.
3. Wait for the dev container to build.
4. When port **6080** appears, open it in the browser.
5. The CWU Kali XFCE desktop will load through noVNC.

GitHub Codespaces runs the development environment in a cloud-hosted container and supports browser access. The forwarded port is used for the web GUI.

## Important

This is an educational Kali environment. Do not expose VNC directly to the public Internet and do not use security tools against systems without explicit authorization. The noVNC service is bound to localhost inside the container and is intended to be reached through the Codespaces forwarded port.

## Included

- Kali Rolling base
- XFCE desktop
- XFCE Terminal
- noVNC browser GUI
- Xvfb virtual display
- x11vnc localhost VNC backend
- Common networking and Python utilities

## Notes

This project provides a reproducible browser lab environment; it is not a bootable ISO or a replacement for installing Kali on physical hardware.
