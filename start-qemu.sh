#!/bin/bash
ROOTFS=rootfs.cpio
KERNEL_IMAGE=$HOME/linux_out_arm64/arch/arm64/boot/Image
qemu-system-aarch64 -cpu cortex-a57 -smp 8 -m 8G \
    -machine virt,gic-version=3,virtualization=on,its=off -nographic \
    -netdev user,id=net -device virtio-net-device,netdev=net \
    -initrd ${ROOTFS} \
    -kernel ${KERNEL_IMAGE} -append "debug ignore_loglevel root=/dev/vda1" 2>&1 | tee console.log
