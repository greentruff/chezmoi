{ ... }:
{
  imports = [
    ./packages.nix
  ];

  home.username = "truff";
  home.homeDirectory = "/Users/truff";
  programs.home-manager.enable = true;

  home.stateVersion = "25.11"; # do not change
}
