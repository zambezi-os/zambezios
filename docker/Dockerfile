FROM ubuntu:24.04

# Buildroot host requirements + QEMU for boot testing.
RUN apt-get update && apt-get install -y --no-install-recommends \
	build-essential ca-certificates git bc bzip2 cpio file findutils gzip perl python3 \
	rsync sed tar unzip wget xz-utils libncurses-dev qemu-system-arm \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /zambezios
