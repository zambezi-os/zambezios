BUILDROOT_VERSION ?= 2025.02
BUILDROOT_REPO    ?= https://gitlab.com/buildroot.org/buildroot.git
BUILDROOT_DIR     := $(CURDIR)/buildroot
BASE_DEFCONFIG    ?= qemu_aarch64_virt_defconfig
FRAGMENT          := $(CURDIR)/configs/zambezios_qemu_virt.fragment

.PHONY: all image defconfig run clean distclean docker-image docker

all: image

$(BUILDROOT_DIR):
	git clone --depth 1 --branch $(BUILDROOT_VERSION) $(BUILDROOT_REPO) $(BUILDROOT_DIR)

defconfig: $(BUILDROOT_DIR)
	$(MAKE) -C $(BUILDROOT_DIR) BR2_EXTERNAL=$(CURDIR) $(BASE_DEFCONFIG)
	$(BUILDROOT_DIR)/support/kconfig/merge_config.sh -m -O $(BUILDROOT_DIR) \
		$(BUILDROOT_DIR)/.config $(FRAGMENT)
	$(MAKE) -C $(BUILDROOT_DIR) olddefconfig

image: defconfig
	$(MAKE) -C $(BUILDROOT_DIR)

run: image
	board/zambezios/qemu-virt/run-qemu.sh $(BUILDROOT_DIR)/output/images

clean:
	$(MAKE) -C $(BUILDROOT_DIR) clean

distclean:
	rm -rf $(BUILDROOT_DIR)

# Buildroot needs a Linux host — build inside a container on macOS/Windows.
docker-image:
	docker build -t zambezios-build -f docker/Dockerfile .

docker: docker-image
	docker run --rm -v $(CURDIR):/zambezios zambezios-build make image

docker-run:
	docker run --rm -v $(CURDIR):/zambezios zambezios-build \
		board/zambezios/qemu-virt/run-qemu.sh $(BUILDROOT_DIR)/output/images
