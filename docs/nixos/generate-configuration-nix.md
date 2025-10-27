# Generating NixOS configuration files

## Partition and Format Drives

=== "EFI"

    ```bash
    sudo fdisk -l
    sudo fdisk /dev/sda #(1)!
    sudo mkfs.fat -F 32 /dev/sda1 # Boot
    sudo mkfs.ext4 /dev/sda2 # Root
    ```

    1. Point to the drive you want to install NixOS on. I recommend 1G for the
       EFI partition.

=== "BIOS"

    ```bash
    sudo fdisk -l
    sudo fdisk /dev/sda #(1)!
    # Root
    sudo mkfs.ext4 /dev/sda2 #(2)!
    ```

    1. Point to the drive you want to install NixOS on. BIOS partition can be
       much smaller than EFI partition.

    2. No need to format BIOS partition

## Mount File systems and Generate Configuration

=== "EFI"

    ```bash
    sudo mount /dev/sda2 /mnt
    sudo mkdir -p /mnt/boot
    sudo mount /dev/sda1 /mnt/boot
    nixos-generate-config --root /mnt
    ```

=== "BIOS"

    ```bash
    sudo mount /dev/sda2 /mnt
    nixos-generate-config --root /mnt #(1)!
    ```

    1. Edit `/mnt/etc/nixos/configuration.nix` and add these two lines:
    ```nix
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    ```

## Install NixOS

=== "Flake"

    ```bash
    nixos-install --flake ~/flake/#HOSTNAME -v #(1)!
    ```

    1. Point --flake to the directory of the flake and specify the hostname if there is multiple defined in the flake.nix.

=== "Non-flake"

    ```bash
    nixos-install # Defaults to /mnt
    ```
