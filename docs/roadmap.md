# ZambeziOS roadmap

## Guiding principle

Ship something that boots before inviting contributors. Open source
communities form around working artifacts, not around ideas.

## Two tracks

| Track | What | Why |
|---|---|---|
| **A — Embedded Linux** | Buildroot/Yocto image for reference hardware | Produces a real, usable OS in weeks–months; teaches boot chain, device trees, drivers, init, OTA |
| **B — Kernel literacy** | xv6 source study + OSDev/Rust bare-metal tutorials | The long-term education track; runs alongside A, feeds eventual deeper work |

Track A is the project. Track B is the apprenticeship.

## Phase 0 — setup

- [x] Reference target: QEMU `virt` aarch64 first; Raspberry Pi 4 second
- [x] Pin a Buildroot release — `2025.02` (LTS line)
- [x] External tree layout: `board/zambezios/` + `configs/zambezios_qemu_virt.fragment`
      on `qemu_aarch64_virt_defconfig`
- [ ] First `make` from clean checkout, boot under QEMU before touching hardware

## Phase 1 — boot

- [ ] Minimal defconfig: kernel + busybox, no extras
- [ ] Serial console bring-up
- [ ] Ethernet + SSH (dropbear) for headless access
- [ ] Deterministic, reproducible image builds (`BR2_REPRODUCIBLE`)
- [ ] Boot-time logging — a boot that can't be measured can't be improved

## Phase 2 — purpose

- [ ] Read-only rootfs (squashfs) + writable overlay — corruption-safe on
      power loss, which is a certainty in field deployment
- [ ] A/B partition scheme with atomic OTA updates (SWUpdate or RAUC)
- [ ] Hardware watchdog enabled — unattended devices must self-recover
- [ ] Application runtime layer (target workloads TBD)
- [ ] Power-loss soak testing: pull the plug mid-write, repeatedly

## Phase 3 — open

- [ ] `CONTRIBUTING.md` — build-from-clean instructions that a stranger can follow
- [ ] CI: image builds + QEMU boot smoke test on every PR
- [ ] Issue labels and a public task board
- [ ] Security disclosure policy
- [ ] First tagged release: `zambezios-v0.1`

## Non-goals (for now)

- Desktop/GUI OS — this is an embedded/edge OS
- Custom kernel from scratch — Track B is study, not product
- Broad hardware support — one reference board done well
