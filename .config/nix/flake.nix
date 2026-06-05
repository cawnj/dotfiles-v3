{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-linux" "x86_64-linux" ];

      perSystem = { config, pkgs, ... }:
        let
          tools = [
            pkgs.ripgrep
            pkgs.fd
            pkgs.jq
            pkgs.gh
            pkgs.nodejs_24
            config.packages.dotnet
          ];
        in
        {
          packages.dotnet = pkgs.callPackage ./tools/dotnet.nix { };
          packages.devbox = pkgs.buildEnv {
            name = "devbox";
            paths = tools;
          };

          devShells.default = pkgs.mkShell {
            packages = tools;
          };
        };
    };
}
