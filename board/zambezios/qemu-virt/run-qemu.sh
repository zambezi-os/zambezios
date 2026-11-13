#!/bin/sh
# Boot the ZambeziOS image in QEMU aarch64 virt.
# SSH: ssh root@localhost -p 2222 (dropbear, no password yet — set one in post-build for anything beyond local).
IMAGES="${1:-$(dirname "$0")/../../buildroot/output/images}"

exec qemu-system-aarch64 \
	-M virt -cpu cortex-a53 -nographic -smp 1 -m 512M \
	-kernel "$IMAGES/Image" \
	-append "rootwait root=/dev/vda console=ttyAMA0" \
	-netdev user,id=eth0,hostfwd=tcp::2222-:22 \
	-device virtio-net-device,netdev=eth0 \
	-drive file="$IMAGES/rootfs.ext2",if=none,format=raw,id=hd0 \
	-device virtio-blk-device,drive=hd0
