CPU_TARGET="`uname -m`"

QEMU_CONF_FLAGS=" \
  --enable-plugins \
  --audio-drv-list= \
  --disable-blobs \
  --disable-bochs \
  --disable-brlapi \
  --disable-bsd-user \
  --disable-bzip2 \
  --disable-cap-ng \
  --disable-cloop \
  --disable-curl \
  --disable-curses \
  --disable-dmg \
  --disable-fdt \
  --disable-gcrypt \
  --disable-glusterfs \
  --disable-gnutls \
  --disable-gtk \
  --disable-guest-agent \
  --disable-iconv \
  --disable-libiscsi \
  --disable-libnfs \
  --disable-libssh \
  --disable-libusb \
  --disable-linux-aio \
  --disable-live-block-migration \
  --disable-lzo \
  --disable-nettle \
  --disable-numa \
  --disable-opengl \
  --disable-parallels \
  --disable-qcow1 \
  --disable-qed \
  --disable-rbd \
  --disable-rdma \
  --disable-replication \
  --disable-sdl \
  --disable-seccomp \
  --disable-sheepdog \
  --disable-smartcard \
  --disable-snappy \
  --disable-spice \
  --disable-system \
  --disable-tools \
  --disable-tpm \
  --disable-usb-redir \
  --disable-vde \
  --disable-vdi \
  --disable-vhost-crypto \
  --disable-vhost-kernel \
  --disable-vhost-net \
  --disable-vhost-scsi \
  --disable-vhost-user \
  --disable-vhost-vdpa \
  --disable-vhost-vsock \
  --disable-virglrenderer \
  --disable-virtfs \
  --disable-vnc \
  --disable-vnc-jpeg \
  --disable-vnc-png \
  --disable-vnc-sasl \
  --disable-vte \
  --disable-vvfat \
  --disable-xen \
  --disable-xen-pci-passthrough \
  --disable-xfsctl \
  --target-list="${CPU_TARGET}-linux-user" \
  --without-default-devices \
  --extra-cflags=-Wno-int-conversion \
  --disable-werror \
  --disable-debug-info \
  --disable-debug-mutex \
  --disable-debug-tcg \
  --disable-qom-cast-debug \
  --disable-stack-protector \
  --disable-docs \
  "

./configure $QEMU_CONF_FLAGS || exit 1

make -j$(nproc) || exit 1

cd build/contrib/plugins/
make all
cd ../../..
