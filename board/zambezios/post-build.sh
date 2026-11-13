#!/bin/sh
# ZambeziOS rootfs finalisation — runs inside the Buildroot target dir.
set -e

echo "zambezios" > "${TARGET_DIR}/etc/hostname"
install -D -m 0644 "${BR2_EXTERNAL_ZAMBEZIOS_PATH}/board/zambezios/motd" \
	"${TARGET_DIR}/etc/motd"
