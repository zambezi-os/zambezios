# ZambeziOS

**English** | [Português](README.pt.md)

Custom embedded Linux operating system built with Buildroot.
Bootable, reproducible, minimal.

## Goals

- Reproducible image builds from a clean checkout
- Read-only rootfs with A/B atomic OTA updates
- Hardware watchdog recovery for unattended deployment
- One reference board done well — initial target: Raspberry Pi 4 (`virt` on QEMU first)

## Status

Phase 0 — external tree in place, first build unverified.

## Build

Requires: `make`, `git`, build toolchain (`gcc`, `ncurses`, `rsync`, `bc`,
`openssl` headers), and `qemu-system-aarch64` to run the result.

```sh
make          # clone Buildroot (pinned), configure, build → buildroot/output/images/
make run      # boot in QEMU aarch64 virt; serial console, ssh on :2222
```

First build downloads the full toolchain — expect tens of minutes.

## License

MIT — see [LICENSE](LICENSE).
