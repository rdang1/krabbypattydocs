{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    {
      devShells =
        nixpkgs.lib.genAttrs [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ]
          (
            system:
            let
              pkgs = import nixpkgs { inherit system; };
            in
            {
              default = pkgs.mkShell {
                buildInputs = [
                  pkgs.python314
                  pkgs.python313Packages.mkdocs
                  pkgs.python313Packages.mkdocs-material
                ];

                shellHook = ''
                  echo ${system}
                '';
              };
            }
          );
    };
}
