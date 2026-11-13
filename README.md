# ZambeziOS

An open-source operating system project — starting as a custom embedded Linux
image, built in the open, for real hardware.

Named for the Zambezi: long reach, many tributaries, feeds everything downstream.

## What this is (and isn't)

ZambeziOS is not a from-scratch kernel (yet). It is a custom **embedded Linux
operating system** — built with [Buildroot](https://buildroot.org) — that boots
real hardware, runs real workloads, and teaches real OS engineering along the
way: boot chain, kernel configuration, device trees, drivers, init systems,
OTA updates.

Writing a competitive kernel is a decade-scale project for a team. Building a
production embedded OS is a one-person, weeks-to-months project — and it is what
every shipping embedded product actually does. That is where ZambeziOS starts.

## Roadmap

See [docs/roadmap.md](docs/roadmap.md). In short:

1. **Phase 0 — setup**: toolchain, Buildroot tree, first defconfig for a
   reference board (Raspberry Pi 4).
2. **Phase 1 — boot**: minimal image that boots to a shell over serial and
   Ethernet. Reproducible from a clean checkout.
3. **Phase 2 — purpose**: read-only rootfs, A/B OTA updates, hardware watchdog,
   application layer. The shape of a field-deployable edge OS.
4. **Phase 3 — open**: contributor docs, CI image builds, community.

## Status

Phase 0. Everything here is early — expect restructuring.

## License

MIT © ZambeziOS contributors
