# ZambeziOS

Custom embedded Linux operating system built with Buildroot.
Bootable, reproducible, minimal.

## Goals

- Reproducible image builds from a clean checkout
- Read-only rootfs with A/B atomic OTA updates
- Hardware watchdog recovery for unattended deployment
- One reference board done well — initial target: Raspberry Pi 4 (`virt` on QEMU first)

## Status

Phase 0 — build system setup. See [docs/roadmap.md](docs/roadmap.md).

## Build

Not yet — Buildroot external tree and first defconfig land in Phase 0/1.

## License

MIT — see [LICENSE](LICENSE).
