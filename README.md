# README for docker-flutter-elinux-builder

## Overview
The "docker-flutter-elinux-builder" is a specialized Docker container designed for building ARM64 applications for Raspberry OS Legacy, specifically targeting eLinux environments. This tool simplifies the process of creating builds based on Debian Bullseye, ensuring compatibility and ease of deployment on Raspberry Pi devices.

## Prerequisites
- Docker installed on your machine.
- Basic knowledge of Docker commands and volume management.
- Source code of the Flutter application you intend to build.

## Usage
To use the docker-flutter-elinux-builder, run the following command in your terminal:

```bash
docker run -it --rm \
    -v f-pub-cache:/root/.pub-cache \
    -v $(pwd):/src \
    mruettgers/flutter-elinux-builder
```

This command performs the following actions:
- Starts an interactive (`-it`) Docker session.
- Removes the container after the build process is completed (`--rm`).
- Mounts two volumes:
  - `f-pub-cache:/root/.pub-cache` for storing the Flutter pub cache.
  - `$(pwd):/src` for accessing your application's source code.
- Executes `flutter-elinux build elinux` in `/src`

### Volume Explanation
1. **Flutter Pub Cache Volume (`f-pub-cache`):**
   - This volume is used to store the Flutter pub cache. It avoids re-downloading packages every time you build your application, saving time and bandwidth.
   - You should create this volume before running the build command if it doesn't already exist.

2. **Application Source Code Volume (`$(pwd):/src`):**
   - This volume mounts your current working directory (where your application's source code resides) to the `/src` directory inside the container.
   - Ensure that you run the Docker command from the root directory of your Flutter application.

## Example Output
Upon running the build command, you should see output similar to the following:

```
MB-Monty ➜ ~/Wor/homelens4 git:(main) ✗ docker run -it --rm -v f-pub-cache:/root/.pub-cache -v $(pwd):/src mruettgers/flutter-elinux-builder

Building an eLinux application with Wayland backend in release mode for ARM64 target... 14.8s
```

This output indicates the successful compilation of an eLinux application with a Wayland backend for an ARM64 target.