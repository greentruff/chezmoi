{ pkgs, ... }:
let
  lspServers = with pkgs; [
    nil
    nixd
  ];

  homelabAdmin = with pkgs; [
    age
    nixos-rebuild-ng
    restic
    sops
  ];
in
{
  home.packages = builtins.concatLists [
    lspServers
    homelabAdmin
  ];
}
