# ZambeziOS

[English](README.md) | **Português**

Sistema operativo Linux embebido, construído com Buildroot.
Arrancável, reproduzível, mínimo.

## Objetivos

- Builds de imagem reproduzíveis a partir de um checkout limpo
- Rootfs apenas de leitura com atualizações OTA atómicas A/B
- Recuperação por watchdog de hardware para instalação autónoma
- Uma placa de referência bem feita — alvo inicial: Raspberry Pi 4 (`virt` no QEMU primeiro)

## Estado

Fase 0 — árvore externa pronta, primeira build por verificar.

## Build

Requer: `make`, `git`, toolchain de build (`gcc`, `ncurses`, `rsync`, `bc`,
headers `openssl`), e `qemu-system-aarch64` para correr o resultado.

```sh
make          # clona o Buildroot (versão fixada), configura, compila → buildroot/output/images/
make run      # arranca no QEMU aarch64 virt; consola série, ssh em :2222
```

A primeira build descarrega a toolchain completa — conte com dezenas de minutos.

## Licença

MIT — ver [LICENSE](LICENSE).
