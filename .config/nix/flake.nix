{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-linux" "x86_64-linux" ];

      perSystem = { config, pkgs, system, ... }:
        let
          nvSources = pkgs.callPackage ./_sources/generated.nix { };
        in
        {
          packages.dotnet = pkgs.callPackage ./packages/dotnet.nix { };
          packages.pup = pkgs.callPackage ./packages/pup.nix {
            inherit (nvSources."pup-${system}") version src;
          };
          packages.default = pkgs.buildEnv {
            name = "devbox-tools";
            paths = [
              pkgs.ripgrep
              pkgs.fd
              pkgs.jq
              pkgs.gh
              pkgs.nodejs_24
              pkgs.zsh
              pkgs.fish
              pkgs.fishPlugins.plugin-git
              config.packages.dotnet
              config.packages.pup
            ];
          };
          devShells.default = pkgs.mkShell {
            packages = [ config.packages.default ];
          };
        };
    };
}
