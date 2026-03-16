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

  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "go";
    builder = "tool";
    pname = "steampipe-plugin-akeyless";
    vendorHash = "sha256-idKunT7bMe+kaLEKMS6r3vB1OI/xY8OnJAXSE3UmHwE=";
    description = "Akeyless plugin for Steampipe - query Akeyless resources with SQL";
    homepage = "https://github.com/pleme-io/steampipe-plugin-akeyless";
  };
}
