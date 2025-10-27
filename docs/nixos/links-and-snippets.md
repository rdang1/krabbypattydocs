# Helpful Links and Snippets

## Snippets

### Rebuilding system

Rebuilds system and switches to new configuration.

=== "Flake"

    ```bash
    sudo nixos-rebuild switch --flake ~/flake/#HOSTNAME -v #(1)!
    ```

    1. Point --flake to the directory of the flake and specify the hostname if
       there is multiple defined in the flake.nix.

=== "Non-flake"

    ```bash
    sudo nixos-rebuild switch -v #(1)!
    ```
    
    1. Uses configuration.nix from /etc/nixos.

### Updating channels

Updates the channels used for rebuild the system. More info about [Nix
channels](https://nixos.wiki/wiki/Nix_channels)

=== "Flake"

    ```bash
    sudo nix flake update --flake ~/flake/ #(1)!
    ```

    1. Point --flake to the directory of the flake.

=== "Non-flake"
    
    ```bash
    sudo nix-channel --update
    ```

### Deleting Old Package and Configurations

Deletes old packages and configuration from nix store[^1].

[^1]: For old Linux kernels located at /boot, the command only marks them for
    deletion and only on rebuild does the kernels get deleted from /boot.

=== "Delete older than X"

    ```bash
    sudo nix-collect-garbage --delete-older-than 30d #(1)!
    ```

    1. Set date to your own perference.

=== "Delete everything"

    ```bash
    sudo nix-collect-garbage --delete-old
    ```

## Helpful Links

- [NixOS Wiki](https://nixos.wiki/)
- [NixOS Package Search](https://search.nixos.org/)
- [NixOS Options Search (Important for home-manager)](https://mynixos.com/)
