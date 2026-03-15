{
  description = "Akeyless plugin for Steampipe - query Akeyless resources with SQL";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkGoTool = (import "${substrate}/lib/go-tool.nix").mkGoTool;
    in {
      packages.default = mkGoTool pkgs {
        pname = "steampipe-plugin-akeyless";
        version = "0.0.0-dev";
        src = self;
        vendorHash = "sha256-idKunT7bMe+kaLEKMS6r3vB1OI/xY8OnJAXSE3UmHwE=";
        description = "Akeyless plugin for Steampipe - query Akeyless resources with SQL";
        homepage = "https://github.com/pleme-io/steampipe-plugin-akeyless";
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ go gopls gotools ];
      };
    });
}
